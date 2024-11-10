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
                                <th>#</th>
                                <th>Subject_id</th>
                                <th>Subject</th>
                                <th>score</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Subject_id</th>
                                <th>Subject</th>
                                <th>score</th>

                            </tr>
                        </tfoot>
                        <tbody>

                            @foreach ($allResults as $singelResult)
                                <tr>
                                    <td>{{ $singelResult->id }}</td>
                                    <td>{{ $singelResult->subject_id }}</td>
                                    <td>{{ $singelResult->subject_name }}</td>
                                    <td>{{ $singelResult->score }}</td>


                                </tr>
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
