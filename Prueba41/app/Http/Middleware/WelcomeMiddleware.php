<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class WelcomeMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(auth()->guest()){
            return $next($request);
        }
        return redirect('home');
    }
}
