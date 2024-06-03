<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return  [
            'id' => $this->id,
            'product_name' => $this->product_name,
            'min_order' => $this->min_order,
            'product_serial_number' => $this->product_serial_number,
            'seller_location' => $this->seller_location,
            'original_or_copy' => $this->original_or_copy,
            'product_image' => asset('storage/' . $this->product_image),
            'price' => $this->price,
            'seller' => $this->seller,
            'created_at' => $this->created_at->diffForHumans(),
            'updated_at' => $this->updated_at,

        ];
    }
}
