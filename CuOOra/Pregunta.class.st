"
Soy una subclase de Post, se representan las preguntas.
    Instance Variables
	misRespuestas:		<Object>
	misTopicos:		<Object>
	titulo:		<Object>


"
Class {
	#name : #Pregunta,
	#superclass : #Post,
	#instVars : [
		'titulo',
		'misRespuestas',
		'misTopicos'
	],
	#category : #CuOOra
}

{ #category : #'instance creation' }
Pregunta class >> nuevoConTopico: unTopico titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
^self new nuevoConTopico: unTopico titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario
]

{ #category : #accessing }
Pregunta >> agregarRespuesta: unaRespuesta [
misRespuestas add: unaRespuesta .
]

{ #category : #initialization }
Pregunta >> initialize [
	super initialize.
	titulo := ''.
	misRespuestas := SortedCollection sortBlock: [ :c1 :c2 | c1 obtenerPuntajePorReacciones >= c2 obtenerPuntajePorReacciones  ].
	misTopicos := OrderedCollection new
]

{ #category : #accessing }
Pregunta >> nuevoConTopico: unTopico titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
	misTopicos add: unTopico . "los topicos puede ser 1 o una lista con varios"
	titulo := unTitulo.
	descripcion := unaDescripcion.
	usuario := unUsuario.
]

{ #category : #accessing }
Pregunta >> obtenerMisRespuestasOrdenadas [
^ misRespuestas. 

]

{ #category : #accessing }
Pregunta >> obtenerMisTopicos [
	^ misTopicos.
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ misRespuestas
]

{ #category : #accessing }
Pregunta >> titulo [
	^ titulo
]
