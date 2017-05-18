'use strict';

const merge = require('webpack-merge');
const UglifyJsPlugin = require('webpack/lib/optimize/UglifyJsPlugin');

module.exports = function(options) {
  const commonConfig = require('./webpack.common')(options);

  return merge(commonConfig, {
    devtool: 'source-map',

    plugins: [
      new UglifyJsPlugin({
        minimize: true,
        compressor: { warnings: false },
        mangle: true,
      }),
    ],
  });
};
