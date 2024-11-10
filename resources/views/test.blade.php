@extends('layouts.main')

@section('content')
    <div class="container mt-3">


        <div id="deadline" class="alert alert-warning">Deadline is: {{ $exam_deadline }}</div>


        <form action="{{ route('submitExam') }}" method="POST">
            {{ csrf_field() }}

            <input type="hidden" name="subjectId" value="{{ $subject_id }}">

            @foreach ($questions as $question)
                <fieldset class="mt-3" id="{{ $question->id }}">
                    <h4>{{ $question->question }}</h4>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="{{ $question->id }}" value="1"
                            id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            {{ $question->answer1 }}
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="{{ $question->id }}" value="2"
                            id="flexRadioDefault2">
                        <label class="form-check-label" for="flexRadioDefault2">
                            {{ $question->answer2 }}
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="{{ $question->id }}" value="3"
                            id="flexRadioDefault2">
                        <label class="form-check-label" for="flexRadioDefault2">
                            {{ $question->answer3 }}
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="{{ $question->id }}" value="4"
                            id="flexRadioDefault2">
                        <label class="form-check-label" for="flexRadioDefault2">
                            {{ $question->answer4 }}
                        </label>
                    </div>
                </fieldset>
            @endforeach



            <button class="btn btn-primary mt-4" id="submitExam">finish exam</button>

        </form>


    </div>

    <script>
        var duration = {{ $duration }} * 60;
        var time = duration;
        var deadline = document.getElementById('deadline')
        var subject_id = {{ $subject_id }};

        setInterval(function() {
            var counter = time--,
                min = (counter / 60) >> 0,
                sec = (counter - min * 60) + '';
            deadline.textContent = 'Exam closes in ' + min + ':' + (sec.length > 1 ? '' : '0') + sec
            // time != 0 || (time = duration);

            if (counter == 0) {
                // submit exam aotomatically
                document.getElementById('submitExam').click();
            }


            // update remaining time every 5 min
            function sendDuration(remaining_time) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        console.log("success");
                    }
                };

                var url = '/sendRemainingTime/' + remaining_time + "/subjectId/" + subject_id;
                xhttp.open("GET", url, true);

                xhttp.send()
            }


            // call this functionn evry 5 min
            var remaining_time = counter / 60;

            if (remaining_time % 5) { // if reminder is 0
                sendDuration(remaining_time);

            }



        }, 1000);
    </script>
@endsection
