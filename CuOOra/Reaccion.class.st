"
Soy una clase que representa las reacciones like o dislike
    Instance Variables
	fechaCreacion:		<Object>
	usuario:		<Object>


    Implementation Points
"
Class {
	#name : #Reaccion,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'fechaCreacion'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Reaccion class >> nuevaConUsuario: unUsuario [
	^ self new nuevoConUsuario: unUsuario.
]

{ #category : #accessing }
Reaccion >> fechaDeCreacion [
	^ fechaCreacion
]

{ #category : #initialization }
Reaccion >> initialize [
	fechaCreacion := DateAndTime now.
	usuario := ''
]

{ #category : #accessing }
Reaccion >> nuevoConUsuario: unUsuario [
usuario  := unUsuario .
^ self.
]

{ #category : #accessing }
Reaccion >> usuario [
	^ usuario
]
