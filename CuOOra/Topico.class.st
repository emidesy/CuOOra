"
Soy una clase que representa los topicos 
    Instance Variables
	descripcion:		<Object>
	nombre:		<Object>


"
Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Topico class >> nuevoConNombre: unNombre descripcion: unaDescripcion [
	^ self new
		nuevoConNombre: unNombre descripcion: unaDescripcion
]

{ #category : #'instance creation' }
Topico class >> nuevoConNombre: unNombre yDescripcion: unaDescripcion [
	^ self new
		nuevoConNombre: unNombre yDescripcion: unaDescripcion
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #initialization }
Topico >> initialize [
	nombre := ''.
	descripcion := ''
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]

{ #category : #accessing }
Topico >> nuevoConNombre: unNombre yDescripcion: unaDescripcion [
nombre:= unNombre .
descripcion := unaDescripcion .
^ self.
	
]
