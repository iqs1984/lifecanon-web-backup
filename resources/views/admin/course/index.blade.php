@extends('layouts.admin')

@section('content')

<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">Course Setting</h6>
                </div>
                <div class="col-lg-6 col-5 text-right">
                    <a href="{{ route('course.create') }}" class="btn btn-neutral">Add New Course</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Page content -->
<div class="container-fluid mt--6">
    <div class="row">
        <div class="col">
            <div class="card bg-default shadow">
                <div class="card-header bg-transparent border-0">
                    <h3 class="text-white mb-0">Course Information</h3>
                    @if(session('success'))
                    <div class="alert alert-success">{{session('success')}}</div>
                    @endif
                </div>
                <div class="table-responsive">
                    <table class="table align-items-center table-dark table-flush">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Type</th>
                            <th scope="col">Hour</th>
                            <th scope="col">Status</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody class="list">
                        @if(count($data)> 0)
                        @foreach($data as $key =>$datas)
                        <tr>
                            <td class="budget">{{ ++$key }}</td>
                            <td>{{ $datas->name }}</td>
                            <td>{{ $datas->type }}</td>
                            <td>{{ $datas->hour }}</td>
                            <td> <span class="badge badge-dot mr-4">
                                        <i class="bg-{{ ($datas->status)?'success':'warning' }}"></i>
                                        <span class="status">{{ ($datas->status)?'Active':'Inactive' }}</span>
                                      </span></td>

                            <td>
                                <a href="{{ route('course.edit', $datas->id) }}" class="text-white">
                                    <span class="mr-2"><i class="fa fa-edit" title="Edit Course"></i></span>
                                </a>
                                <span> {!! Form::open([
                                          'method'=>'DELETE',
                                          'route' => ['course.destroy', $datas->id],
                                          'style' => 'display:inline'
                                          ]) !!}
                                            {!! Form::button('<i class="fa fa-trash text-danger" aria-hidden="true"></i>', array(
                                          'type' => 'submit',
                                          'class' => 'btn',
                                          'title' => 'Delete Course',
                                          'onclick'=>'return confirm("Are you sure about deleting Course?")'
                                          )) !!}
                                          {!! Form::close() !!}</span>
                            </td>
                        </tr>
                        @endforeach
                        @else
                        <tr><td colspan="7" class="text-center">No Record Found</td></tr>
                        @endif
                        </tbody>
                    </table>
                </div>

                <div class="card-footer py-4">
                    {{ $data->links('vendor.pagination.admin') }}
                </div>

            </div>
        </div>
    </div>

</div>

@endsection
