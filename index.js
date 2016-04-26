/* jshint node: true */
'use strict';

var Funnel = require('broccoli-funnel');
var mergeTrees = require('broccoli-merge-trees');

module.exports = {
  name: 'ember-test-assets',

  treeForPublic: function(originalTree) {
    var tree = this._super.treeForPublic(originalTree);

    if (!this.app.tests) {
      return tree;
    }

    if (!tree) {
      return new Funnel('tests/assets');
    }

    return mergeTrees(['public', 'tests/assets'], { overwrite: true });
  }
};
