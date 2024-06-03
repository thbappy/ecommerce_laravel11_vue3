<template>
    <div>
        <div class="text-center">
            <h4 class="text-center">Seller List {{ sellers.length }}</h4>
        </div>
        <div class="mb-3 text-end">
            <button class="btn btn-primary" @click="showAddModal">Add Seller</button>
        </div>
        <table class="table table-sm">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Phone</th>
                <th scope="col">Address</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="(seller, index) in sellers" :key="seller.id">
                <th scope="row">{{ index + 1 }}</th>
                <td>{{ seller.name }}</td>
                <td>{{ seller.email }}</td>
                <td>{{ seller.phone }}</td>
                <td>{{ seller.address }}</td>
                <td>
                    <button class="btn btn-sm btn-warning" @click="showUpdateModal(seller)">Update</button>
                    <button class="btn btn-sm btn-danger" @click="deleteSeller(seller.id)">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>

        <!-- Update Seller Modal -->
        <div class="modal" id="updateSellerModal" tabindex="-1" aria-labelledby="updateSellerModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateSellerModalLabel">Update Seller</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="updateSeller">
                            <div class="mb-3">
                                <label for="sellerName" class="form-label">Name</label>
                                <input v-model="selectedSeller.name" type="text" class="form-control" id="sellerName" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerEmail" class="form-label">Email</label>
                                <input v-model="selectedSeller.email" type="email" class="form-control" id="sellerEmail" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerPhone" class="form-label">Phone</label>
                                <input v-model="selectedSeller.phone" type="text" class="form-control" id="sellerPhone" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerAddress" class="form-label">Address</label>
                                <input v-model="selectedSeller.address" type="text" class="form-control" id="sellerAddress" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Seller Modal -->
        <div class="modal" id="addSellerModal" tabindex="-1" aria-labelledby="addSeller" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSeller">Add Seller</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="addSeller">
                            <div class="mb-3">
                                <label for="sellerName" class="form-label">Name</label>
                                <input v-model="selectedSeller.name" type="text" class="form-control" id="sellerName" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerEmail" class="form-label">Email</label>
                                <input v-model="selectedSeller.email" type="email" class="form-control" id="sellerEmail" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerPhone" class="form-label">Phone</label>
                                <input v-model="selectedSeller.phone" type="text" class="form-control" id="sellerPhone" required>
                            </div>
                            <div class="mb-3">
                                <label for="sellerAddress" class="form-label">Address</label>
                                <input v-model="selectedSeller.address" type="text" class="form-control" id="sellerAddress" required>
                            </div>

                            <button type="submit" class="btn btn-primary">Save </button>
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
    name: 'SellerList',
    data() {
        return {
            sellers: [],
            selectedSeller: {}
        };
    },
    methods: {
        async getSellers() {
            try {
                const response = await axios.get('/api/admin/sellers',{
                    headers: {
                        Authorization: `Bearer ${this.$store.state.token}`,
                    },
                });
                if (response.status === 200) {
                    console.log(response,33)
                    this.sellers = response.data.data;
                }
            } catch (error) {
                console.error(error);
            }
        },
        showAddModal(){
            const modalElement = document.getElementById('addSellerModal');
            const modal = new Modal(modalElement);
            modal.show();
        },

        showUpdateModal(seller) {
            this.selectedSeller = { ...seller };
            const modalElement = document.getElementById('updateSellerModal');
            const modal = new Modal(modalElement);
            modal.show();
        },
        async addSeller() {
            try {
                const response = await axios.post(`/api/admin/sellers`, this.selectedSeller, {
                    headers: {
                        Authorization: `Bearer ${this.$store.state.token}`,
                    }
                });
                if (response.status === 200 || response.status == 201) {
                    this.getSellers();
                    const modalElement = document.getElementById('addSellerModal');
                    const modal = Modal.getInstance(modalElement);
                    modal.hide();
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Seller updated successfully'
                    });
                }
            } catch (error) {
                console.error(error);
            }
        },
        async updateSeller() {
            try {
                const response = await axios.put(`/api/admin/sellers/${this.selectedSeller.id}`, this.selectedSeller,{
                    headers: {
                        Authorization: `Bearer ${this.$store.state.token}`,
                    },
                });
                if (response.status === 200) {
                    this.getSellers();
                    const modalElement = document.getElementById('updateSellerModal');
                    const modal = Modal.getInstance(modalElement);
                    modal.hide();
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Seller updated successfully'
                    });
                }
            } catch (error) {
                console.error(error);
            }
        },
        async deleteSeller(sellerId) {
            try {
                const result = await Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                });
                if (result.isConfirmed) {
                    const response = await axios.delete(`/api/admin/sellers/${sellerId}`,{
                        headers: {
                            Authorization: `Bearer ${this.$store.state.token}`,
                        },
                    });
                    if (response.status === 200 || response.status === 204) {
                        this.getSellers();
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Seller deleted successfully'
                        });
                    }
                }
            } catch (error) {
                console.error(error);
            }
        }
    },
    created() {
        this.getSellers();
    }
};
</script>

<style scoped>
.text-center {
    text-align: center;
}
</style>
