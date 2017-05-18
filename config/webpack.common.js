'use strict';

const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = function(options) {
  return {
    entry: {
      'app': path.join(options.paths.src, 'index.js'),
    },

    output: {
      path: options.paths.dist,
      filename: '[name].[hash].bundle.js',
      sourceMapFilename: '[name].[hash].bundle.js.map',
    },

    module: {
      // https://github.com/rtfeldman/elm-webpack-loader#noparse
      noParse: /.elm$/,

      rules: [
        {
          test: /\.elm$/,
          exclude: [
            /elm-stuff/,
            /node_modules/,
          ],
          loader: options.isProd ?
            'elm-webpack-loader' :
            'elm-hot-loader!elm-webpack-loader?verbose=true&warn=true',
        },
      ]
    },

    plugins: [
      new HtmlWebpackPlugin({
        template: path.join(options.paths.src, 'index.html'),
      })
    ],
  };
};
