# ember-test-assets

Avoid 404 network errors when fetching assets that don't exists in tests.

This addon merges `/tests/assets` folder with `/public` folder on tests. Put
your dummy assets inside `/tests/assets` and reference them as absolute path in
your tests `User.create({ avatar_url: 'my_avatar.jpg' })`

## Installation

* `git clone` this repository
* `npm install`
* `bower install`

## Running

* `ember server`
* Visit your app at http://localhost:4200.

## Running Tests

* `npm test` (Runs `ember try:testall` to test your addon against multiple Ember versions)
* `ember test`
* `ember test --server`

## Building

* `ember build`

For more information on using ember-cli, visit [http://ember-cli.com/](http://ember-cli.com/).

## License

ember-test-assets is licensed under the MIT license.

See [LICENSE.md](./LICENSE.md) for the full license text.
