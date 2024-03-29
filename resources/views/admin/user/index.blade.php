@extends('layouts.admin')

@section('content')

<div class="header bg-primary pb-6">
    <div class="container-fluid">
        <div class="header-body">
            <div class="row align-items-center py-4">
                <div class="col-lg-6 col-7">
                    <h6 class="h2 text-white d-inline-block mb-0">User Panel</h6>
                </div>
                <div class="col-lg-6 col-5 text-right">
                    <!--<a href="{{ route('admin.viewReportedUser',['type'=>$type]) }}" class="btn btn-neutral">View Reported User</a>
                    <a href="{{ route('user.create') }}" class="btn btn-neutral">Add New User</a>-->
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
                    <h3 class="text-white mb-0">User Information</h3>
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
                            <th scope="col">Email</th>
                            <th scope="col">User Type</th>
                            <th scope="col">Status</th>
                            <th scope="col">Created at</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody class="list">
                        @if(count($data)> 0)
                        @foreach($data as $key =>$datas)
						<?php if($datas->status){?>
                        <tr>
                            <td class="budget">{{ ++$key }}</td>
                            <td>{{ $datas->name }}</td>
                            <td>{{ $datas->email }}</td>
                            <td>{{ ($datas->user_type==1)?'Coach':'Client' }}</td>
                            <td>{{ $datas->status==1?"active":"" }} {{ $datas->status==0?"inactive":"" }} {{ $datas->status==2?"Reported":"" }}</td>
                            <td>{{ $datas->created_at->format('d M Y h:i a') }}</td>

                            <td>
                                <a href="{{ route('user.edit', $datas->id) }}" class="text-white">
                                    <span class="mr-2"><i class="fa fa-edit" title="Edit User"></i></span>
                                </a>
                                <span> {!! Form::open([
                                          'method'=>'DELETE',
                                          'route' => ['user.destroy', $datas->id],
                                          'style' => 'display:inline'
                                          ]) !!}
                                            {!! Form::button('<i class="fa fa-trash text-danger" aria-hidden="true"></i>', array(
                                          'type' => 'submit',
                                          'class' => 'btn',
                                          'title' => 'Delete User',
                                          'onclick'=>'return confirm("Are you sure about deleting User?")'
                                          )) !!}
                                          {!! Form::close() !!}</span>
                            </td>
                        </tr>
						<?php } ?>
                        @endforeach
                        @else
                        <tr><td colspan="7" class="text-center">No Record Found</td></tr>
                        @endif
                        </tbody>
                    </table>
                </div>

                <div class="card-footer py-4">
                    {{ $data->appends(['type'=>$type])->links('vendor.pagination.admin') }}
                </div>

            </div>
        </div>
    </div>

</div>

@endsection
