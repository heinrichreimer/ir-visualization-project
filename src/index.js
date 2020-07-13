'use strict';

import './index.html'
import 'bootstrap'
import './main.scss'

import { Elm } from './Main.elm'
Elm.Main.init({
    node: document.getElementById('container'),
    flags: {
        year: 2020
    }
});
