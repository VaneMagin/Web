@extends('layouts.app')

@section('content')
<main class="container">
    <!-- Title -->
    <div class="home-title row">
        <div class="home-title_text pl-3 mr-5">
            <h1 class="mt-4 mt-sm-5 text-purple ">Diseño Web</h1>
            <p>Gen41</p>
        </div>
        <div class="home-title_foto ">
            <img src="img/ToyFace17.png" alt="">
        </div>
    </div>
    <hr>
    <h2 class="pendientesh2 text-purple mt-2 text-orange">Tareas pendientes</h2>
    <!-- Cursos <0 -->
        <div class="cursos-index mt-4">
            <div class="row row-cols-1 row-cols-lg-2 ">
                <!-- Card 1 -->

                @foreach($tareas as $tarea)
                <p class="d-none">{{$bandera=0}}</p>
                @foreach($entregas as $entrega)
                @if($entrega->tarea_id==$tarea->id)
                <p class="d-none">{{$bandera=1}}</p>
                    
                @endif
                @endforeach
                @if($bandera==0)
                <div class="col mb-4">
                    <div class="card h-100 bg-yellow p-3 p-xl-4">
                        <div class="home-cursos_titulo d-flex">
                            <div class="cursos-card_header">
                                <h2 class="card-title pt-1 pl-2">{{$tarea->title}}</h2>
                                <h3 class="pl-2">{{$tarea->date}} a las {{$tarea->time}}</h3>
                            </div>
                        </div>
                        <hr>
                        <p class="card-text">{{$tarea->description}}</p>
                        <a class="card-text w-50" href="{{asset("tareas/$tarea->file")}}">{{$tarea->file}}</a>
                        <a href="{{route('entregas.show', $tarea->id)}}" class="btn btn-success card-entregar mt-5">Entregar</a>
                    </div>
                </div>
                @endif
                
                @endforeach
            </div>
        </div>
</main>
@endsection
