'use strict';

const WEBPACK_MODE = 'production';

const merge = require('webpack-merge');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const { config: commonConfig } = require('./webpack.common')(WEBPACK_MODE);

module.exports = merge(commonConfig, {
  mode: WEBPACK_MODE,
  devtool: 'source-map',

  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        uglifyOptions: {
          minimize: true,
          compressor: { warnings: false },
          mangle: true,
        },
      }),
    ],
  },
});
