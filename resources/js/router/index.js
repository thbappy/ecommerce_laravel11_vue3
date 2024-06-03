import { createRouter, createWebHistory } from 'vue-router';
import store from '../store/index';
import Login from '../components/Login.vue';
import Register from '../components/Register.vue';
import Dashboard from '../components/Dashboard.vue';
import AdminDashboard from '../components/AdminDashboard.vue';
import NotFound from '../components/error/404.vue';
import UserList from '../components/user/Index.vue';
import Home from '../components/Home.vue'
import Seller from '../components/seller/Index.vue';
import Product from '../components/product/Index.vue';

const routes = [
    { path: '/login', component: Login },
    { path: '/register', component: Register },
    { path: '/', component: Home },
    // user routes
    { path: '/dashboard', component: Dashboard, meta: { requiresAuth: true, role: 'user' }},
    //admin routes
    { path: '/admin', component: AdminDashboard, meta: { requiresAuth: true, role: 'admin' }},
    { path: '/admin/users', component: UserList, meta: { requiresAuth: true, role: 'admin' }},
    //seller routes
    { path: '/admin/sellers', component: Seller, meta: { requiresAuth: true, role: 'admin' }},

    //product routes
    { path: '/admin/products', component: Product, meta: { requiresAuth: true, role: 'admin' }},

    { path: '/:pathMatch(.*)*', component: NotFound},
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

router.beforeEach((to, from, next) => {
    const isAuthenticated = store.state.token;
    const userRole = store.state.role;

    if (to.meta.requiresAuth && isAuthenticated == null) {
        next('/login');
    } else if (to.meta.requiresAuth && to.meta.role !== userRole) {
        next('/login');
    } else {
        next();
    }
});
export default router;
