@extends('layouts.main')

@section('content')
    <div class="container mt-3">

        <fieldset id="question1">
            <h3>This is the question</h3>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                <label class="form-check-label" for="flexRadioDefault1">
                    answer 1
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                <label class="form-check-label" for="flexRadioDefault2">
                    answer 2
                </label>
            </div>
        </fieldset>

    </div>
@endsection
