This Docker image is used in development and testing environments. It aims at mirroring our production setup as close as possible. The image is based on Debian buster (see https://github.com/docker-library/ruby/blob/master/3.0/buster/Dockerfile)

## How to build this image

* As soon as a new commit is pushed to GitHub the image will automatically build using Docker Hub's infrastructure. The build status can be monitored [here](https://hub.docker.com/r/aventurini/ci-ruby/builds).
* Docker tag names will be derived from the name of the branch
* To build the image locally the supplied build shell script can be used

## Included dependencies

### Node.js

By default Node.js 20 will be installed as per the [official guidelines](https://github.com/nodesource/distributions?tab=readme-ov-file#installation-instructions). Note that `npm` is no logner installed.

### Google Chrome

The latest stable version of Chrome/ChromeDriver will be installed automatically.

### Yarn 2

The latest version of Yarn 2+ (berry) is installed via [Corepack](https://yarnpkg.com/getting-started/install)

### wkhtmltopdf

The latest stable version of wkhtmltopdf is installed (currently v0.12.6.1)
