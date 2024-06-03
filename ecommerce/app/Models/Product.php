<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
         'product_name', 'min_order', 'product_serial_number','price', 'seller_location', 'original_or_copy', 'product_image'
    ];

    public function seller()
    {
        return $this->belongsTo(Seller::class);
    }
}
