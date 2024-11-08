<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestsController extends Controller
{

    public function getTestQuestions()
    {

        // check if user has  already taken the exam
        $has_taken_exam = DB::table('results')->where('user_id', auth()->id())->exists();

        if ($has_taken_exam) {
            return redirect()->route('main')->with('hasTakenExam', 'You have already taken the exam');
        } else {

            $questions =  DB::table('tests')->get();
            return view('test', ['questions' => $questions]);
        }
    }

    public function submitExam(Request $request)
    {
        $answers =  $request->all();
        $points = 0;
        $percentage = 0;
        $totalQuestions = 2;

        foreach ($answers as $questionId => $userAnswer) {
            // if the id is not a number then don`t try to get an answer
            if (is_numeric($questionId)) {

                $questionInfo =  DB::table('tests')->where('id', $questionId)->get();

                $correctAnswer =  $questionInfo[0]->correct_answer;

                if ($correctAnswer == $userAnswer) {
                    // give user a point
                    $points++;
                }
            }
        }
        // calculate score
        $percentage = ($points / $totalQuestions) * 100;

        // insert score in the result table
        DB::table('results')->insert([
            'user_id' => auth()->id(),
            'score' => $percentage,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // return to main page
        return redirect()->route('main')->with('examSubmitted', 'The exam has been submitted successfully, check your profile for the results later');
    }
}
