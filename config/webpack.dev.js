'use strict';

const WEBPACK_MODE = 'development';

const merge = require('webpack-merge');
const { options, config: commonConfig } = require('./webpack.common')(WEBPACK_MODE);

module.exports = merge(commonConfig, {
  mode: WEBPACK_MODE,
  devtool: 'cheap-module-source-map',

  output: {
    publicPath: `http://${options.host}:${options.port}/`,
  },

  devServer: {
    host: options.host,
    port: options.port,
    inline: true,
    historyApiFallback: true,
  },
});
