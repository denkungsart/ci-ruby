## How to build this image

* Builds will happen automatically on pushes
* The Dockerfile is expected to be located at the root folder
* Docker tag names will be the same as the name of the branch
* Use the supplied build shell script to build an image locally

## Included dependencies

#### Node.js

Node.js 8 will be installed via package manager as per the [official guidelines](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions). You can install a different version by declaring it in the Dockerfile before the install-node script is called, e.g. `ENV NODE_VERSION 7.x`.

#### PhantomJS

PhantomJS 2.1.1 static binary obtained from [https://bitbucket.org/ariya/phantomjs/downloads](https://bitbucket.org/ariya/phantomjs/downloads) will be install at `/usr/local/bin/`. You can install a different version by declaring it in the Dockerfile before the install-phantomjs script is called, e.g. `ENV PHANTOMJS_VERSION 1.9.8`.

#### Google Chrome

* The currently available version for the Google Chrome stable package can be found [in the Google Chrome PPA list](https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable). Note that the build **will fail** if the supplied `CHROME_VERSION` in Dockerfile does not correspond w/ the latest version in this list.
* To prevent an issue where Chrome tests fail to start in an unprivileged docker container the sandbox feature of Chrome is turned off by default.
* A list w/ available versions of Chrome WebDriver can be found [here](https://sites.google.com/a/chromium.org/chromedriver/downloads). Ensure the version used is compatible w/ the Google Chrome version.
