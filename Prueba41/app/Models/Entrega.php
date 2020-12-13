<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entrega extends Model
{
    use HasFactory;

    public function user(){
        return $this->belongsTo('App\Models\User');//muchos a 1
    }

    public function tarea(){
        return $this->belongsTo('App\Models\Tarea');//muchos a 1
    }
}
