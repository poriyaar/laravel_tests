@if (session('examSubmitted'))
    <div class="alert alert-success mt-3 text-center">
        {{ session('examSubmitted') }}
    </div>
@endif

@if (session('hasTakenExam'))
    <div class="alert alert-danger mt-3 text-center">
        {{ session('hasTakenExam') }}
    </div>
@endif

@if (session('registerForExam'))
    <div class="alert alert-success mt-3 text-center">
        {{ session('registerForExam') }}
    </div>
@endif

@if (session('alreadyRegisterForExam'))
    <div class="alert alert-danger mt-3 text-center">
        {{ session('alreadyRegisterForExam') }}
    </div>
@endif

@if (session('registeredFirst'))
    <div class="alert alert-danger mt-3 text-center">
        {{ session('registeredFirst') }}
    </div>
@endif
