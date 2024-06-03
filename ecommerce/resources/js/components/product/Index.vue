<template>
    <div>
        <div class="text-center">
            <h4 class="text-center">Product List {{ products.length }}</h4>
        </div>
        <div class="mb-3 text-end">
            <button class="btn btn-primary" @click="showAddModal">Add Product</button>
        </div>
        <table class="table table-sm">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Min Order</th>
                <th scope="col">Serial Number</th>
                <th scope="col">Price</th>
                <th scope="col">Location</th>
                <th scope="col">Original/Copy</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(product, index) in products" :key="product.id">
                <th scope="row">{{ index + 1 }}</th>
                <td>{{ product.product_name }}</td>
                <td>{{ product.min_order }}</td>
                <td>{{ product.product_serial_number }}</td>
                <td>{{ product.price }}</td>
                <td>{{ product.seller_location }}</td>
                <td>{{ product.original_or_copy }}</td>
                <td>
                    <button class="btn btn-sm btn-warning" @click="showUpdateModal(product)">Update</button>
                    <button class="btn btn-sm btn-danger" @click="deleteProduct(product.id)">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>

        <!-- Update Product Modal -->
        <div class="modal" id="updateProductModal" tabindex="-1" aria-labelledby="updateProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateProductModalLabel">Update Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="updateProduct">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Name</label>
                                <input v-model="selectedProduct.product_name" type="text" class="form-control" id="productName" required>
                            </div>
                            <div class="mb-3">
                                <label for="minOrder" class="form-label">Min Order</label>
                                <input v-model="selectedProduct.min_order" type="number" class="form-control" id="minOrder" required>
                            </div>
                            <div class="mb-3">
                                <label for="productSerialNumber" class="form-label">Serial Number</label>
                                <input v-model="selectedProduct.product_serial_number" type="text" class="form-control" id="productSerialNumber" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input v-model="selectedProduct.price" type="number" class="form-control" id="price" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerLocation" class="form-label">Location</label>
                                <input v-model="selectedProduct.seller_location" type="text" class="form-control" id="sellerLocation" required>
                            </div>
                            <div class="mb-3">
                                <label for="originalOrCopy" class="form-label">Original/Copy</label>
                                <select v-model="selectedProduct.original_or_copy" class="form-control" id="originalOrCopy" required>
                                    <option value="original">Original</option>
                                    <option value="copy">Copy</option>
                                </select>
                            </div>
                            <!-- Add image upload field -->
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Image</label>
                                <input type="file" class="form-control" id="productImage" accept="image/*" @change="handleImageUpload">
                            </div>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Product Modal -->
        <div class="modal" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="addProduct">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Name</label>
                                <input v-model="selectedProduct.product_name" type="text" class="form-control" id="productName" required>
                            </div>
                            <div class="mb-3">
                                <label for="minOrder" class="form-label">Min Order</label>
                                <input v-model="selectedProduct.min_order" type="number" class="form-control" id="minOrder" required>
                            </div>
                            <div class="mb-3">
                                <label for="productSerialNumber" class="form-label">Serial Number</label>
                                <input v-model="selectedProduct.product_serial_number" type="text" class="form-control" id="productSerialNumber" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input v-model="selectedProduct.price" type="number" class="form-control" id="price" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerLocation" class="form-label">Location</label>
                                <input v-model="selectedProduct.seller_location" type="text" class="form-control" id="sellerLocation" required>
                            </div>
                            <div class="mb-3">
                                <label for="originalOrCopy" class="form-label">Original/Copy</label>
                                <select v-model="selectedProduct.original_or_copy" class="form-control" id="originalOrCopy" required>
                                    <option value="original">Original</option>
                                    <option value="copy">Copy</option>
                                </select>
                            </div>
                            <!-- Add image upload field -->
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Image</label>
                                <input type="file" class="form-control" id="productImage" accept="image/*" @change="handleImageUpload">
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import { Modal } from 'bootstrap';
import Swal from 'sweetalert2';

export default {
    name: 'ProductList',
    data() {
        return {
            products: [],
            selectedProduct: {},
            productImage: null
        };
    },
    methods: {
        async getProducts() {
            try {
                const response = await axios.get('/api/admin/products');
                this.products = response.data;
            } catch (error) {
                console.error(error);
            }
        },
        showAddModal() {
            this.selectedProduct = {};
            const modalElement = document.getElementById('addProductModal');
            const modal = new Modal(modalElement);
            modal.show();
        },
        showUpdateModal(product) {
            this.selectedProduct = { ...product };
            const modalElement = document.getElementById('updateProductModal');
            const modal = new Modal(modalElement);
            modal.show();
        },
        async addProduct() {
            try {
                const formData = new FormData();
                formData.append('product_name', this.selectedProduct.product_name);
                formData.append('min_order', this.selectedProduct.min_order);
                formData.append('product_serial_number', this.selectedProduct.product_serial_number);
                formData.append('price', this.selectedProduct.price);
                formData.append('seller_location', this.selectedProduct.seller_location);
                formData.append('original_or_copy', this.selectedProduct.original_or_copy);
                formData.append('product_image', this.productImage);
                const response = await axios.post('/api/admin/products', formData,{
                    headers: {
                        Authorization: `Bearer ${this.$store.state.token}`,
                    },
                });
                this.products.push(response.data);
                $('#addProductModal').modal('hide');
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Product added successfully',
                });
            } catch (error) {
                console.error(error);
            }
        },
        async updateProduct() {
            try {
                const formData = new FormData();
                formData.append('product_name', this.selectedProduct.product_name);
                formData.append('min_order', this.selectedProduct.min_order);
                formData.append('product_serial_number', this.selectedProduct.product_serial_number);
                formData.append('price', this.selectedProduct.price);
                formData.append('seller_location', this.selectedProduct.seller_location);
                formData.append('original_or_copy', this.selectedProduct.original_or_copy);
                formData.append('product_image', this.productImage); // Append the image file
                const response = await axios.put(`/api/products/${this.selectedProduct.id}`, formData);
                const index = this.products.findIndex(product => product.id === this.selectedProduct.id);
                if (index !== -1) {
                    this.products.splice(index, 1, response.data);
                }
                $('#updateProductModal').modal('hide');
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Product updated successfully',
                });
            } catch (error) {
                console.error(error);
            }
        },
        async deleteProduct(productId) {
            try {
                await axios.delete(`/api/products/${productId}`);
                this.products = this.products.filter(product => product.id !== productId);
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: 'Product deleted successfully',
                });
            } catch (error) {
                console.error(error);
            }
        },
        handleImageUpload(event) {
            this.productImage = event.target.files[0]; // Store the selected image file
        }
    },
    created() {
        this.getProducts();
    }
};
</script>
