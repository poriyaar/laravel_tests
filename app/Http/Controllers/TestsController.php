<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestsController extends Controller
{
    //add comment
    public function getTestQuestions(Request $request, $subject_id)
    {
        $student_already_registered = DB::table('students')->where('user_id', auth()->id())->where('subject_id', $subject_id)->exists();
        $has_taken_exam = DB::table('results')->where('user_id', auth()->id())->where('subject_id', $subject_id)->exists();

        // has user registered for this exam
        $has_student_register_for_exam = DB::table('students')->where('user_id', auth()->id())->where('subject_id', $subject_id)->exists();

        if ($has_taken_exam) {
            return redirect()->route('main')->with('hasTakenExam', 'You have already taken the exam');
        } elseif (!$has_student_register_for_exam) {

            return redirect()->route('dashboard')->with('registeredFirst', 'You have not registered for this exam yet');

            // user has already registered
        } elseif (!$student_already_registered) {
            return redirect()->route('dashboard')->with('registerFirst', 'You have not registered for this exam yet');
        } else {

            $questions =  DB::table('tests')->where('subject_id', $subject_id)->get();
            $exam_deadline = DB::table('subjects')->where('id', $subject_id)->value('exam_deadline');

            // if student  starts the exam for the first time then return this
            $duration = DB::table('subjects')->where('id', $subject_id)->value('duration');

            // if something goes wrong, then use remaining_time
            $remaining_time = DB::table('students')->where('user_id', auth()->id())->where('subject_id', $subject_id)->value('remaining_time');

            if ($remaining_time == null) {

                return view('test', ['questions' => $questions, 'subject_id' => $subject_id, 'exam_deadline' => $exam_deadline, 'duration' => $duration]);
            } else {
                return view('test', ['questions' => $questions, 'subject_id' => $subject_id, 'exam_deadline' => $exam_deadline, 'duration' => $remaining_time]);
            }
        }
    }

    public function submitExam(Request $request)
    {
        $answers =  $request->all();
        $points = 0;
        $percentage = 0;
        $subjectId = $request->input('subjectId');
        $totalQuestions = DB::table('tests')->where('subject_id', $subjectId)->count();

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


        $subjectName = DB::table('subjects')->where('id', $subjectId)->value('name');

        // insert score in the result table
        DB::table('results')->insert([
            'user_id' => auth()->id(),
            'score' => $percentage,
            'subject_id' => $subjectId,
            'subject_name' => $subjectName,
            'created_at' => now(),
            'updated_at' => now(),
        ]);


        // remove student info from student table

        DB::table('students')->where('user_id', auth()->id())->where('subject_id', $subjectId)->delete();


        // return to main page
        return redirect()->route('main')->with('examSubmitted', 'The exam has been submitted successfully, check your profile for the results later');
    }


    public function allResults()
    {

        // get all result that belong to  the currently logged in user
        $allResults = DB::table('results')->where('user_id', auth()->id())->get();

        return view('table.allResult', ['allResults' => $allResults]);
    }

    public function allTests()
    {

        $subjects =  DB::table('students')->where('user_id', auth()->id())
            ->join('subjects', 'students.subject_id', '=', 'subjects.id')->get();

        return view('table.allTests', ['subjects' => $subjects]);
    }





    public function registerExam(Request $request, $subject_id)
    {



        // check if user already registered
        $student_already_registered = DB::table('students')->where('user_id', auth()->id())->where('subject_id', $subject_id)->exists();



        $has_taken_exam = DB::table('results')->where('user_id', auth()->id())->where('subject_id', $subject_id)->exists();

        if ($has_taken_exam) {
            return redirect()->route('dashboard')->with('hasTakenExam', 'You have already taken this exam before ');
        } elseif ($student_already_registered) {
            return redirect()->route('dashboard')->with('alreadyRegisterForExam', 'You have already registered for this exam before');
        } else {

            DB::table('students')->insert([
                'user_id' => auth()->id(),
                'name' => auth()->user()->name,
                'subject_id' => $subject_id,
                'created_at' => now(),
                'updated_at' => now(),

            ]);

            return redirect()->route('dashboard')->with('registerForExam', 'You have successfully registered for exam');
        }
    }

    public function sendRemainingTime($remaining_time, $subject_id)
    {
        DB::table('students')->where('user_id', auth()->id())->where('subject_id', $subject_id)->update([
            "remaining_time" => $remaining_time
        ]);

        return "updated remaining_time";
    }
}
