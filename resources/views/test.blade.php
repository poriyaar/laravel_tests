@extends('layouts.main')

@section('content')
    <div class="container mt-3">

        <form action="{{ route('submitExam') }}" method="POST">
            {{ csrf_field() }}
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



            <button class="btn btn-primary mt-4">finish exam</button>

        </form>


    </div>
@endsection
