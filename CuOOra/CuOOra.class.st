"
Clase principal del sistema donde se guardaran las instancias de las demas clases
    Instance Variables
	nombre:		<Object>
	preguntasSistema:		<Object>
	topicosSistema:		<Object>
	usuariosSistema:		<Object>


    Implementation Points
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'topicosSistema',
		'usuariosSistema',
		'preguntasSistema'
	],
	#category : #'CuOOra-model'
}

{ #category : #initialization }
CuOOra >> initialize [
usuariosSistema:= OrderedCollection new .
preguntasSistema:= OrderedCollection new.
topicosSistema:= OrderedCollection new
]
