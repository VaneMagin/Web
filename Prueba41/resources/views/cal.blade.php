@extends('layouts.app')
@section('content')
<main class="container">
	<!-- Title -->
	<div class="home-title row">
		<div class="home-title_text pl-5 mr-5">
			<h1 class="mt-4 mt-sm-5 text-purple ">Mis Calificaciones</h1>
		</div>
		<div class="home-title_foto d-none d-md-block">
			<img src="img/ToyFace3.png" alt="">
		</div>
	</div>
	<section class="entregas mt-5">
		<table class="table table-hover ml-4 mt-4">
			<thead class="bg-lpurple">
				<tr>
					<th scope="col">Tarea</th>
					<th scope="col">Comentario</th>
					<th scope="col">Calificación</th>
				</tr>
			</thead>
			<tbody>
				@foreach($entregas as $entrega)
				<tr>
					<th scope="row">{{$entrega->tarea->title}}</th>
					<td>{{$entrega->comments}}</td>
					<td>{{$entrega->cal}}</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</section>
</main>
@endsection