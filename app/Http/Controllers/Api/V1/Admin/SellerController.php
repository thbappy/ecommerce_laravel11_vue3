<?php

namespace App\Http\Controllers\Api\V1\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\SellerResource;
use App\Models\Seller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class SellerController extends Controller
{
    public function index()
    {
        $sellers = SellerResource::collection(Seller::all());
        return response()->json(['message' => 'Sellers retrieved successfully', 'data' => $sellers], Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:sellers',
            'phone' => 'required|string|max:15',
            'address' => 'required|string',
        ]);

        $seller = Seller::create($validatedData);

        return response()->json(['message' => 'Seller created successfully', 'data' => new SellerResource($seller)], Response::HTTP_CREATED);
    }

    public function show(Seller $seller)
    {
        return response()->json(['message' => 'Seller retrieved successfully', 'data' => new SellerResource($seller)], Response::HTTP_OK);
    }

    public function update(Request $request, Seller $seller)
    {
        $validatedData = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'email' => 'sometimes|required|string|email|max:255|unique:sellers,email,' . $seller->id,
            'phone' => 'sometimes|required|string|max:15',
            'address' => 'sometimes|required|string',
        ]);

        $seller->update($validatedData);

        return response()->json(['message' => 'Seller updated successfully', 'data' => new SellerResource($seller)], Response::HTTP_OK);
    }

    public function destroy(Seller $seller)
    {
        $seller->delete();
        return response()->json(['message' => 'Seller deleted successfully'], Response::HTTP_NO_CONTENT);
    }
}
