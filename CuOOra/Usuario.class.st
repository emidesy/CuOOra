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
	#classInstVars : [
		'soleInstance'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Usuario class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #creation }
Usuario class >> nombre: nombre domicilio: unDomicilio [
	^ self new
		domicilio: unDomicilio;
		nombre: nombre;
		yourself
]

{ #category : #'instance creation' }
Usuario class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
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
nombre:=''.
contrasena:=''.
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
Usuario >> nuevoConNombre:unNombre YContrasena: unaContrasena [
nombre := unNombre.
contrasena:= unaContrasena.
^ self.
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
