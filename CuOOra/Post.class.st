"
soy una clase que identifica a todos los post, siendo los mismos preguntas o respuestas
    Instance Variables
	descripcion:		<Object>
	fechaCreacion:		<Object>
	misDislikes:		<Object>
	misLikes:		<Object>
	usuario:		<Object>

"
Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'fechaCreacion',
		'usuario',
		'misLikes',
		'misDislikes'
	],
	#category : #CuOOra
}

{ #category : #accessing }
Post >> darDislike: unUsuario [
	| like |
	self eliminarReaccion: unUsuario.
	like := Reaccion nuevaConUsuario: unUsuario.
	misDislikes add: like
]

{ #category : #accessing }
Post >> darLike: unUsuario [ 
|like|
self eliminarReaccion: unUsuario.
like := Reaccion nuevaConUsuario: unUsuario .
misLikes add: like.
]

{ #category : #accessing }
Post >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Post >> eliminarReaccion: unUsuario [
	| borrar |
	borrar := misLikes select: [ :aux | aux usuario = unUsuario ].
	misLikes removeAll: borrar.
	borrar := misDislikes select: [ :aux | aux usuario = unUsuario ].
	misDislikes removeAll: borrar
]

{ #category : #accessing }
Post >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #initialization }
Post >> initialize [
	descripcion := ''.
	usuario := ''.
	fechaCreacion := Date today.
	misLikes:= OrderedCollection new.
	misDislikes := OrderedCollection new.
]

{ #category : #accessing }
Post >> obtenerPuntajePorReacciones [
|puntaje|.
puntaje := ((misLikes size) - (misDislikes size)).
^ puntaje




]

{ #category : #accessing }
Post >> usuario [
	^ usuario
]
