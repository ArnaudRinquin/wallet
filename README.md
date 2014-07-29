Angular Wallet
==============

[ ![Codeship Status for ArnaudRinquin/wallet](https://www.codeship.io/projects/4bb61f00-f953-0131-b886-26b5a351acb8/status)](https://www.codeship.io/projects/28850)

## Stack

### Toolchain

* Gulp
* Browserify
* CoffeeScript
* SASS + Compass
* Karma + Jasmine

### Running code

* Angular
* Font-Awesome
* jQuery
* Angular UI-Routeur

## Setup & build

### Install Gulp and Bower Globally
Gulp must be installed globally in order to use the command line tools. *You may need to use `sudo`*
```
npm install -g gulp bower
```

### Install Compass (if you haven't already)
The gulp-compass module relies on Compass already being installed on your system.
```
gem update --system
gem install compass
```
### Install npm and bower dependencies
```
npm install && bower install
```
This runs through all dependencies listed in `package.json` and downloads them
to a `node_modules` folder in your project directory.

### Run gulp and be amazed.
```
gulp
```

This will create and run the task defined in `gulpfile.js`. If you're on OS X,
and have Chrome installed, a window will open displaying the demo page. If not,
you can visit http://localhost:8080 to view the test page.

## Deployment

### Current instances

Continuous deployment through codeship: [awallet](http://awallet.herokuapp.com/)

### Heroku

1. Create an app

```
heroku apps:create wallet
```

2. Set the app custom buildpack:

```
heroku config:add BUILDPACK_URL=https://github.com/9elements/heroku-buildpack-nodejs-gulp-haml-sass-compass.git -a wallet
```
3. Add the heroku app as a git repo:

```
git remote add heroku git@heroku.com:wallet.git
```