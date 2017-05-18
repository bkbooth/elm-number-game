'use strict';

// Inject bundled Elm app
var Elm = require('./app/Main.elm');
Elm.Main.embed(document.getElementById('app'));
