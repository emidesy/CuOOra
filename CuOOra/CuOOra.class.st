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
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #access }
CuOOra >> agregarUsuario: unUsuario [
	usuariosSistema add: unUsuario.
	
]

{ #category : #access }
CuOOra >> initialize [
usuariosSistema:= OrderedCollection new .
preguntasSistema:= OrderedCollection new.
topicosSistema:= OrderedCollection new
]

{ #category : #access }
CuOOra >> loginConNombre: unNombre yContrasena: aPassword [
	^ usuariosSistema
		detect: [ :each | each nombre = unNombre & (each contrasena = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #access }
CuOOra >> nuevoConNombre: unNombre yContrasena: unaContrasena [
	| aux |
	aux := Usuario nuevoConNombre: unNombre yContrasena: unaContrasena.
	usuariosSistema add: aux.
	^aux.
]
