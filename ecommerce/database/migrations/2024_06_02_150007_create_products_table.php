<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
//            $table->unsignedBigInteger('seller_id');
            $table->string('product_name');
            $table->integer('min_order');
            $table->string('product_serial_number');
            $table->string('price');
            $table->string('seller_location');
            $table->enum('original_or_copy', ['original', 'copy']);
            $table->string('product_image');
            $table->timestamps();

//            $table->foreign('seller_id')->references('id')->on('sellers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
