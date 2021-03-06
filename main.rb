#!/usr/bin/env ruby

require 'instagram'
require 'fileutils'
require 'open-uri'

unless ARGV[0]
  puts 'An username must be provided'
  puts 'Eg: `./main.rb sergiosj`'
  exit
end

puts 'Starting proccess. This can take a while'

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
end

@username = ARGV[0]

all_medias = []
all_videos = []
max_id = nil

def search_for_user_id
  users = Instagram.user_search(@username)
  if correct_user = users.reject{|user| user.username != @username}.first
    return correct_user.id
  else
    puts 'User not found'
    puts 'But we found some users:' if users.any?
  end
  users.each do |user|
    if is_correct_user?(user.username)
      return user.id
    end
  end
  puts 'Sorry, user not found :('
  nil
end

def is_correct_user?(username)
  puts "Is /#{username} the correct user? (y/n)"
  answer = STDIN.gets.chomp
  ['Y', 'y', 'yes', 'YES'].include?(answer)
end

user_id = search_for_user_id

exit if user_id.nil?

loop do
  media_items = Instagram.user_recent_media(user_id, count: 100, max_id: max_id)
  media_items.each do |media_item|
    all_medias << media_item
    all_videos << media_item if media_item.type == 'video'
  end
  max_id = media_items.pagination.next_max_id
  break if max_id.nil?
end

puts 'All medias archived.'
puts 'Creating folders'

default_dir = [Dir.home, "instagram_#{@username}"]

photos_path = [default_dir, 'photos'].flatten
photos_path = FileUtils.mkdir_p(File.join(*photos_path))[0]

videos_path = [default_dir, 'videos'].flatten
videos_path = FileUtils.mkdir_p(File.join(videos_path))[0]

puts "Downloading all photos (#{all_medias.count})"

all_medias.each do |media_item|
  media_url = media_item.images.standard_resolution.url
  media_name = media_url.split('/').last
  print '.'
  File.open(File.join(photos_path, media_name), 'wb') do |f|
    f.write(open(media_url).read)
  end
end

puts ''

puts "Downloading all videos (#{all_videos.count})"

all_videos.each do |media_item|
  media_url = media_item.videos.standard_resolution.url
  media_name = media_url.split('/').last
  print '.'
  File.open(File.join(videos_path, media_name), 'wb') do |f|
    f.write(open(media_url).read)
  end
end

puts ''

puts "ALL DONE :D"
