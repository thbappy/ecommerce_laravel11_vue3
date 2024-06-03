<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $products = [
            [
                'product_name' => 'Product 1',
                'min_order' => 1,
                'product_serial_number' => 'SN001',
                'price' => '100.00',
                'seller_location' => 'Location 1',
                'original_or_copy' => 'original',
                'product_image' => 'image1.jpg',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        for ($i = 2; $i <= 18; $i++) {
            $products[] = [
                'product_name' => "Product $i",
                'min_order' => $i,
                'product_serial_number' => "SN00$i",
                'price' => '100.00',
                'seller_location' => "Location $i",
                'original_or_copy' => ($i % 2 == 0) ? 'original' : 'copy',
                'product_image' => "image$i.jpg",
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DB::table('products')->insert($products);
    }
}
