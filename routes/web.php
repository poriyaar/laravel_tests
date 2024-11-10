<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestsController;

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


Route::get('/test/{subject_id}', [TestsController::class, 'getTestQuestions'])->name('getTestQuestions')->middleware('auth');

Route::post('/submitExam', [TestsController::class, 'submitExam'])->name('submitExam');




Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {

        // get all subjects
        $subjects = DB::table('subjects')->get();


        // get data from database
        return view('dashboard', ['subjects' => $subjects]);
    })->name('dashboard');
});


Route::get('/register_exam/{subject_id}', [TestsController::class, 'registerExam'])->name('registerExam');

Route::get('/allResults', [TestsController::class, 'allResults'])->name('allResults');
Route::get('/allTests', [TestsController::class, 'allTests'])->name('allTests');

Route::get('sendRemainingTime/{remaining_time}/subjectId/{subject_id}', [TestsController::class, "sendRemainingTime"])->name('sendRemainingTime');
