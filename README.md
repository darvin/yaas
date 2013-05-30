[![browser support](https://ci.testling.com/darvin/yaas.png)](https://ci.testling.com/darvin/yaas)

# yaas - yet another angular seed


## Why?
Because I'm not satisfied with the seeds out there. [Yeoman](http://yeoman.io) isn't working for me yet and it's Windows support leaves much desired.



## What can it do for me?
When it's setup it will make your development live much easier. You will be able to use the following awesome and hip technologies

* [Anuglar.js](http://angularjs.org) for the framework
* [CoffeeScript](http://coffeescript.org/) and [browserify](http://browserify.org/) for the source
* [LESS](http://lesscss.org/) for the style
* [Bootstrap](twitter.github.com/bootstrap/) with [FontAwesome](http://fortawesome.github.com/Font-Awesome/) for the layout
* [Jade](http://jade-lang.com/) for the templates
* [Phantomjs](http://phantomjs.org/) for the headless
* [Mocha](http://visionmedia.github.com/mocha/) and [Chai](http://chaijs.com/) for the tests
* [Bower](http://twitter.github.com/bower/) for dependencies

## How do I get it?
Install it via
```bash
$ git clone https://github.com/Dignifiedquire/yaas.git
$ cd yaas
$ npm install
```
If you want to use PhantomJS you need to get it [here](http://phantomjs.org/download.html).


## Where do all my files live?
```
build/
  dev/
  prod/
app/
  assets/
    style/
      app.scss
    img/
    font/
  controllers/
  directives/
  filters/
  partials/
  services/
  index.jade
  app.coffee
config/
  karma/
vendor/
  img/
  font/
  script/
  style/
```

## How does this magic happen?
This project uses [grunt](http://gruntjs.com) for the build process and all the other magic. The tests are run via [karma](http://karma-runner.github.com).

### Tasks

#### Watch
 * watches all source files and recompiles them on save

#### karma Unit/E2E
* Runs a karma server that watches for changes in the test files
  and runs the tests on save


## What can I do for it?
* file issues
* fix issues



