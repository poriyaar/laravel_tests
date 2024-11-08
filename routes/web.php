<?php

use App\Http\Controllers\TestsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
})->name('main');


 Route::get('/test' , [TestsController::class , 'getTestQuestions'])->name('getTestQuestions')->middleware('auth');

 Route::post('/submitExam' , [TestsController::class , 'submitExam'])->name('submitExam');




Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        // get data from database
        return view('dashboard');
    })->name('dashboard');
});
