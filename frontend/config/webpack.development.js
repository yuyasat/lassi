var webpack = require('webpack');
var path = require('path')

module.exports = {
  devtool: 'inline-source-map',
  entry: {
    application: './src/javascripts/application.js',
    footerOpinion: './src/javascripts/Opinion',
  },
  output: {
    path: path.resolve(__dirname, '../../app/assets/javascripts'),
    filename: '[name].js'
  },
  plugins: [
    new webpack.ProvidePlugin({ $: 'jquery', jQuery: 'jquery' })
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['es2015', 'stage-2']
          }
        }
      },
      {
        test: /\.vue$/,
        loader: 'vue'
      },
      {
        test: /\.scss$/,
        loaders: ['style', 'css', 'sass']
      },
      { test: /\.css$/, loader: 'style-loader!css-loader' },
      {
        test: /\.(jpe|jpg|woff|woff2|eot|ttf|svg)(\?.*$|$)/,
        loader: 'url-loader?mimetype=application/font-woff'
      }
    ]
  },
  resolve: {
    alias: {
      'vue': 'vue/dist/vue.common.js',
    }
  }
}
