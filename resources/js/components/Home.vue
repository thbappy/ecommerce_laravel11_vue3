<template>
    <div class="container">
        <div id="productSlider" class="carousel slide" data-bs-ride="carousel" data-bs-interval="10000">
            <div class="carousel-inner">
                <div
                    class="carousel-item"
                    v-for="(chunk, index) in productChunks"
                    :class="{ active: index === 0 }"
                    :key="index"
                >
                    <div class="row">
                        <div
                            class="col-4 p-1"
                            v-for="product in chunk"
                            :key="product.id"
                            @mouseover="hoverProduct(product.id)"
                            @mouseleave="unhoverProduct(product.id)"
                        >
                            <div class="card" :class="{ 'hovered': product.hovered }">
                                <div class="card-body" style="background:gainsboro">
                                    <div class="text-center mb-3">
                                        <h5 class="card-title">{{ product.product_name }}</h5>
                                        <p class="card-text">Min order: {{ product.min_order }}</p>
                                        <p class="card-text">Serial No: {{ product.product_serial_number }}</p>
                                    </div>
                                    <img :src="product.product_image" class="card-img-top mx-auto d-block" style="width:100px;height:100px" :alt="product.name" />
                                    <div class="d-flex justify-content-between mt-3">
                                        <span>{{ product.created_at }}</span>
                                        <span class="mx-auto">{{ product.seller_location }}</span>
                                        <span>
                            <i :class="product.original_or_copy === 'original' ? 'fas fa-check-circle' : 'fas fa-copy'"></i>
                            {{ product.original_or_copy }}
                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#productSlider" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productSlider" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    data() {
        return {
            products: [

            ],
        };
    },
    computed: {
        productChunks() {
            const shuffledProducts = this.shuffleArray(this.products);
            return this.chunkArray(shuffledProducts, 6);
        },
    },
    created() {
        this.getProducts();
    },
    methods: {
        async getProducts() {
            try {
                const response = await axios.get('/api/product-list');
                this.products = response.data.data;
            } catch (error) {
                console.error(error);
            }
        },
        chunkArray(array, chunkSize) {
            const chunks = [];
            for (let i = 0; i < array.length; i += chunkSize) {
                chunks.push(array.slice(i, i + chunkSize));
            }
            return chunks;
        },
        shuffleArray(array) {
            return array.sort(() => Math.random() - 0.5);
        },
        // hoverProduct(productId) {
        //     this.products = this.products.map(product =>
        //         product.id === productId ? { ...product, hovered: true } : product
        //     );
        // },
        // unhoverProduct(productId) {
        //     this.products = this.products.map(product =>
        //         product.id === productId ? { ...product, hovered: false } : product
        //     );
        // },
    },
};
</script>

<style>
.card {
    transition: transform 0.3s;
}

.card.hovered {
    transform: scale(1.05);
}
</style>
