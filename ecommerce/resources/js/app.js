import './bootstrap';
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/js/bootstrap.bundle';
import store from './store';

const app = createApp(App)

app.use(router)
app.use(store)
app.mount('#app')

