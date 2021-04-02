"
Soy una clase que representa los usuarios del sistema

    Instance Variables
	contrasena:		<Object>
	fechaCreacion:		<Object>
	nombre:		<Object>

"
Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'fechaCreacion',
		'contrasena',
		'usuariosQueSigo'
	],
	#category : #'CuOOra-model'
}

{ #category : #creation }
Usuario class >> nuevoConNombre: unNombre yContrasena: unaContrasena [
	^ self new
		nuevoConNombre: unNombre yContrasena: unaContrasena;
		yourself
]

{ #category : #accessing }
Usuario >> contrasena [
	^ contrasena
]

{ #category : #accessing }
Usuario >> crearPreguntaConTopico: unTopico Titulo: unTitulo Descripcion: unaDescripcion [
|p|
p := Pregunta nuevoConTopico: unTopico titulo: unTitulo  descripcion: unaDescripcion  usuario: self.
^ p.
]

{ #category : #accessing }
Usuario >> darDislikeaPost: unPost [
unPost darDislike: self.
]

{ #category : #accessing }
Usuario >> darLikeaPost: unPost [
unPost darLike: self.
]

{ #category : #accessing }
Usuario >> dejarDeSeguirUsuario: unUsuario [

	|borrar|
	borrar := usuariosQueSigo  select: [ :aux | aux usuario = unUsuario ].
	usuariosQueSigo  removeAll: borrar.
]

{ #category : #accessing }
Usuario >> fechaCreacion [
	^ fechaCreacion
]

{ #category : #initialization }
Usuario >> initialize [
	nombre := ''.
	contrasena := ''.
	fechaCreacion := DateAndTime now.
	usuariosQueSigo := OrderedCollection new
	
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre
]

{ #category : #accessing }
Usuario >> nombre: anObject [
	nombre := anObject
]

{ #category : #initialization }
Usuario >> nuevoConNombre: unNombre yContrasena: unaContrasena [
	nombre := unNombre.
	contrasena := unaContrasena.
	^ self
]

{ #category : #accessing }
Usuario >> quitarReaccionaPost: unPost [
unPost eliminarReaccion: self.
]

{ #category : #initialization }
Usuario >> seguirUsuario: unUsuario [.
usuariosQueSigo add: unUsuario.
]
