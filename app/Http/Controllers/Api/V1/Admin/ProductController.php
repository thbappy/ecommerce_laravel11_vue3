<?php

namespace App\Http\Controllers\Api\V1\Admin;
use App\Http\Controllers\Controller;

use App\Http\Resources\ProductResource;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('seller')->get();
        $products = ProductResource::collection($products);
        return response()->json(['message' => 'Product retrieved successfully', 'data' => $products], Response::HTTP_OK);
    }

    public function productList(){
        $products = Product::with('seller')->inRandomOrder()->get();
        $products = ProductResource::collection($products);
        return response()->json(['message' => 'Product retrieved successfully', 'data' => $products], Response::HTTP_OK);
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
            'price' => 'required',
        ]);

        $imagePath = $request->file('product_image')->store('product_images', 'public');

        $product = Product::create(array_merge(
            $validatedData,
            ['product_image' => $imagePath]
        ));

        return response()->json(['message' => 'Product created successfully', 'data' => new ProductResource($product)], Response::HTTP_CREATED);

    }

    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $validatedData = $request->validate([
            'product_name' => 'required|string|max:255',
            'min_order' => 'required|integer',
            'product_serial_number' => 'required|string|max:255',
            'seller_location' => 'required|string|max:255',
            'original_or_copy' => 'required|in:original,copy',
            'price' => 'required',
        ]);

        if ($request->hasFile('product_image')) {
            Storage::disk('public')->delete($product->product_image);
            $imagePath = $request->file('product_image')->store('product_images', 'public');
            $validatedData['product_image'] = $imagePath;
        }

        $product->update($validatedData);
        return response()->json(['message' => 'Product updated successfully', 'data' => new ProductResource($product)], Response::HTTP_OK);

    }
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        Storage::disk('public')->delete($product->product_image);
        $product->delete();
        return response()->json(['message' => 'Product deleted successfully'], Response::HTTP_NO_CONTENT);
    }
}
