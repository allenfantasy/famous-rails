# Famous-Rails

**Famo.us for Rails assets pipeline**
## Warning!

* This gem may have several issues when used in production mode because of the conflict between assets pipeline & RequireJS.
But it (should) work well in dev mode.
* Since Famo.us has promoted its brand new [Famous Engine](http://famous.org/), which is not compatible with the old Famo.us (<= 0.3), this repo would fail if you are using the latest famo.us codebase.
* I would like to improve this but short of time. [Contributions](#contributing) needed!

## Installation

Add this line to your application's Gemfile:

    gem 'famous-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install famous-rails

## Usage

Say we have a Famo.us App like following:

```javascript
- app/
  - content/
    - fonts/
      - a.ttf
    - images/
      - famous_logo.png
  - index.html
  - lib/
    - ...
  - src/
    - main.js
    - requireConfig.js
    - views/
        - ...
  - styles/
    - app.css
```

And here we want to move this app into Rails. [sounds like a fool, 
but sometimes we have to, LOL]

### Javascript

Setup a file structure as following:
```javascript
- app/
  - assets/
    - javascripts/
      - subapp/
        - app.js
        - main.js (should be the entrance of your Famo.us App)
        - requireConfig.js
        - views/
      - subapp.js
```

In `subapp/app.js`:
```javascript
//= require require
//= require ./requireConfig
//= require famous
//= require ./main
```

In `subapp.js`:
```javascript
//= require class_list
//= require function_prototype_bind
//= require request_animation_frame
    
//= require subapp/app
```

In `requireConfig.js`

```javascript
/*globals require*/
require.config({
    baseUrl: 'assets/subapp', // ATTENTION: ADD THIS LINE
    shim: {

    },
    paths: {
        famous: '../lib/famous',
        requirejs: '../lib/requirejs/require',
        almond: '../lib/almond/almond'
    },
    packages: [

    ]
});
require(['main']);
```

### Stylesheets

Create `subapp.css` in `app/assets/stylesheets`

```css
/*
 *= require famous
 */

/* Your Own App CSS */
@font-face {
  font-family: 'myFont';
  src: url('myfont.ttf');
}

html {
  background: #fff;
}
```

### Image & Fonts [TBD]

## Contributing

1. Fork it ( https://github.com/allenfantasy/famous-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
