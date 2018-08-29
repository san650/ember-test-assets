'use strict';

var Funnel = require('broccoli-funnel');
var fs = require('fs');
var path = require('path');

module.exports = {
  name: 'ember-test-assets',

  treeFor: function() {
    if (!this.app.tests) {
      return;
    }

    return this._super.treeFor.apply(this, arguments);
  },

  treeForPublic: function() {
    var assets = path.join(this.app.project.root, 'tests/assets/');
    var stat;

    try {
      stat = fs.statSync(assets);

      if (stat.isDirectory()) {
        return new Funnel('tests/assets');
      }
    } catch(e) {}
  }
};
