import Vue from 'vue'
import App from './App'
import store from './store' // store
import plugins from './plugins' // plugins
import './permission' // permission
import DictData from './components/dict/init'
import DictTag from './components/dict/DictTag'

Vue.component('DictTag', DictTag)

Vue.use(plugins)

Vue.config.productionTip = false
Vue.prototype.$store = store

App.mpType = 'app'
DictData.install()

const app = new Vue({
    ...App
})

app.$mount()
