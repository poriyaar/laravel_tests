<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestsController extends Controller
{

    public function getTestQuestions()
    {
      $questions =  DB::table('tests')->get();
      return view('test' , ['questions' => $questions]);
    }

    public function submitExam(Request $request)
    {
        // $request contains the answer

      $answers =  $request->all();

      dd($answers);
    }

}
