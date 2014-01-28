# Instagram backup

## Quickstart

- Public instagram profile (visible)
- Create an application [http://instagram.com/developer/clients/manage/](http://instagram.com/developer/clients/manage/)

```sh
$ git clone git://github.com/ssjr/instagram_backup.git instagram-backup
$ cd instagram-backup
$ export INSTAGRAM_CLIENT_ID=your_client_id
$ export INSTAGRAM_CLIENT_SECRET=your_client_secret
$ ./main.rb userName
```

All medias will be found at `~/instagram_[username]`

## ToDo

- [ ] Replace `curl` and `mkdir` with Ruby

---------------------
The MIT License (MIT)

Copyright (c) 2014 Sérgio Schnorr Júnior

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
