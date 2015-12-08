### Docker image for Drone CI

Container for Drone CI testing based on [Dockerfile](https://github.com/docker-library/ruby/blob/74ee8aec9c17ea2134db8a8ef199cf092c829576/2.1/Dockerfile) from official Ruby repository. Supplemented with Node.js, PhantomJS, wkhtmltopdf, pdftk, ffprobe and postgresql-client.

#### Node.js

node.js binary distribution for amd64 obtained from [official repository](https://github.com/nodesource/distributions).

#### PhantomJS

Static PhantomJS 1.9.8 binary obtained from [https://bitbucket.org/ariya/phantomjs/downloads](https://bitbucket.org/ariya/phantomjs/downloads).

#### wkhtmltopdf

Static wkhtmltopdf 0.12.2.1 binary for amd64 extracted from [official Debian Jessie package](http://wkhtmltopdf.org/downloads.html).

#### pdftk

pdftk 2.0.2 installed from official debian repository.

#### ffprobe

ffprobe version N-51558-g3e1724b static binary for amd64 extracted from [ffmpeg static binary package](http://johnvansickle.com/ffmpeg/).

#### postgresql-client

postgresql-client 9.4 installed from official debian repository.
