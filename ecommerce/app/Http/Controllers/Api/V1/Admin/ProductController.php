<?php

namespace App\Http\Controllers\Api\V1\Admin;
use App\Http\Controllers\Controller;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('seller')->inRandomOrder()->take(6)->get();
        return response()->json($products);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'product_name' => 'required|string|max:255',
            'min_order' => 'required|integer',
            'product_serial_number' => 'required|string|max:255',
            'seller_location' => 'required|string|max:255',
            'original_or_copy' => 'required|in:original,copy',
            'product_image' => 'required|image|max:2048',
        ]);

        $imagePath = $request->file('product_image')->store('product_images', 'public');

        $product = Product::create(array_merge(
            $validatedData,
            ['product_image' => $imagePath]
        ));

        return response()->json(['message' => 'Product added successfully', 'product' => $product], 201);
    }
}
