<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\PokemonCollection;
use App\Http\Resources\V1\PokemonResource;
use App\Models\Pokemon;
use Illuminate\Http\Request;

class PokemonController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new PokemonCollection(Pokemon::all());
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    { }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        if (is_numeric($id))
        {
            $pokemon = Pokemon::find($id);
        }
        else
        {
            $pokemon = Pokemon::where('name', $id)->first();
        }
        
        return new PokemonResource($pokemon);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Pokemon $pokemon)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Pokemon $pokemon)
    {
        //
    }
}
