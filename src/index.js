'use strict';

// Load the elm-css stylesheet
require('./app/Stylesheets.elm');

// Inject bundled Elm app
var Elm = require('./app/Main.elm');
Elm.Main.embed(document.getElementById('app'));
