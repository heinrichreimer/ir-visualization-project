const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
    entry: './src/index.js',
    plugins: [
        new CleanWebpackPlugin(),
        new HtmlWebpackPlugin({
            template: "./src/index.html"
        }),
    ],
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: '[name].js',
    },
    module: {
        rules: [
            {
                test: /\.(css|scss)$/i,
                use: ['style-loader', 'css-loader','sass-loader'],
            },
            {
                test:    /\.html$/i,
                loader:  'html-loader',
            },
            {
                test:    /\.elm$/i,
                exclude: [/elm-stuff/, /node_modules/],
                use: [
                    { loader: 'elm-hot-webpack-loader' },
                    {
                        loader: 'elm-webpack-loader',
                        options: {
                            verbose: true,
                            optimize: true
                        }
                    }
                ]
            },
        ],
        noParse: /\.elm$/,
    },
    devServer: {
        inline: true,
        stats: { colors: true },
    },
};


