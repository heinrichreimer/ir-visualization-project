const path = require('path')
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const StylelintPlugin = require('stylelint-webpack-plugin');

module.exports = {
    entry: './src/index.js',
    plugins: [
        new CleanWebpackPlugin(),
        new HtmlWebpackPlugin(),
        new MiniCssExtractPlugin(),
        new StylelintPlugin(),
    ],
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: '[name].js',
    },
    module: {
        rules: [
            {
                test: /\.(css|scss)$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader','sass-loader'],
            },
            {
                test: /\.html$/i,
                use: 'html-loader',
            },
            {
                test: /\.elm$/i,
                exclude: [/elm-stuff/, /node_modules/],
                use: ['elm-hot-webpack-loader', 'elm-webpack-loader?optimize=true']
            },
        ],
        noParse: /\.elm$/,
    },
};
