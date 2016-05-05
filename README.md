# ember-test-assets

[![Build Status](https://travis-ci.org/san650/ember-test-assets.svg?branch=master)](https://travis-ci.org/san650/ember-test-assets)
![Latest version](https://img.shields.io/npm/v/ember-test-assets.svg)

Add assets for tests easily and avoid 404 network errors.

This addon let's you add assets to be consumed by your tests just by dropping
them into `/tests/assets/` folder. When in test mode, this folder is merged with `/public` folder on build.

Let's say you're showing the user avatar on a page so you'll have a dummy user
pointing to a dummy image like the following

```js
User.create({ avatar_url: '/images/my_avatar.jpg' })
```

Then you can place this image into `/tests/assets/images` and when the
acceptance tests run, the browser will find the image and don't throw those
noisy and useless 404 request errors.

## Installation

```sh
$ ember install ember-test-assets
```

Or

```sh
$ npm install --save-dev ember-test-assets
```

## Development

### Get the source code

```sh
$ git clone https://github.com/san650/ember-test-assets.git
```

### Running Tests

```sh
$ npm test
```

### Project's health

[![Build Status](https://travis-ci.org/san650/ember-test-assets.svg?branch=master)](https://travis-ci.org/san650/ember-test-assets)
[![Ember Observer Score](http://emberobserver.com/badges/ember-test-assets.svg)](http://emberobserver.com/addons/ember-test-assets)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2a4d6a0ba67f448abddad2e007e665cf)](https://www.codacy.com/app/san650/ember-test-assets)

## License

ember-test-assets is licensed under the MIT license.

See [LICENSE.md](./LICENSE.md) for the full license text.
