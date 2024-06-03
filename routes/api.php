<?php

use App\Http\Controllers\Api\V1\Admin\ProductController;
use App\Http\Controllers\Api\V1\Admin\SellerController;
use App\Http\Controllers\Api\V1\Admin\UserController;
use App\Http\Controllers\Api\V1\Auth\AuthController;
use App\Http\Controllers\Api\V1\Auth\ForgotPasswordController;
use App\Http\Controllers\Api\V1\Auth\ResetPasswordController;
use Illuminate\Support\Facades\Route;

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('forgot-password', [ForgotPasswordController::class, 'sendResetLinkEmail']);
Route::post('reset-password', [ResetPasswordController::class, 'reset']);

Route::get('product-list', [ProductController::class, 'productList']);

Route::middleware('auth:sanctum')->group(function () {
    Route::prefix('admin')->middleware('admin')->group(function () {
        Route::apiResource('products', ProductController::class);
        Route::apiResource('sellers', SellerController::class);

        //user
        Route::get('/user-list', [UserController::class, 'index']);
        Route::put('/user/{id}', [UserController::class, 'update']);
        Route::delete('/user/{id}', [UserController::class, 'destroy']);

        //seller
        Route::apiResource('/sellers', SellerController::class);
    });
});
