import './styles/main.scss'
import 'bootstrap'
import * as Elm from '../src/Main.elm'

// Inject bundled Elm app.
Elm.Main.init({
    node: document.getElementById('main')
});
