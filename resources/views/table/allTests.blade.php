@extends('table.main')



@section('studentContent')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4"> @include('addons.flash')</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Name</th>
                                <th>Exam Availability</th>
                                <th>Exam Statt Date</th>
                                <th>Deadline</th>
                                <th>Register</th>
                                <th>Start Exam</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>id</th>
                                <th>Name</th>
                                <th>Exam Availability</th>
                                <th>Exam Statt Date</th>
                                <th>Deadline</th>
                                <th>Register</th>
                                <th>Start Exam</th>
                            </tr>
                        </tfoot>
                        <tbody>

                            @foreach ($subjects as $subject)
                                @if ($subject->exam_deadline > date('Y-m-d H:i:s'))
                                    <tr>
                                        <td>{{ $subject->id }}</td>
                                        <td>{{ $subject->name }}</td>
                                        <td>{{ $subject->exam_availability == 1 ? 'Yes' : 'NO' }}</td>
                                        <td>{{ $subject->exam_start_date }}</td>
                                        <td>{{ $subject->exam_deadline }}</td>
                                        @if ($subject->exam_deadline > date('Y-m-d H:i:s'))
                                            <td> <a class="btn btn-primary btn-sm"
                                                    href="{{ route('registerExam', ['subject_id' => $subject->id]) }}">
                                                    Register</a>
                                            </td>
                                        @else
                                            <td>deadline passed </td>
                                        @endif


                                        @if ($subject->exam_start_date > date('Y-m-d H:i:s'))
                                            <td></td>
                                        @elseif ($subject->exam_deadline > date('Y-m-d H:i:s'))
                                            <td> <a class="btn btn-danger btn-sm"
                                                    href="{{ route('getTestQuestions', ['subject_id' => $subject->id]) }}">
                                                    start
                                                    Exam</a></td>
                                        @else
                                            <td>deadline passed</td>
                                        @endif

                                    </tr>
                                @else
                                    <div></div>
                                @endif
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->
@endsection
