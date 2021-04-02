Class {
	#name : #RegisterComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
RegisterComponent >> name [
	^ name
]

{ #category : #accessing }
RegisterComponent >> name: anObject [
	name := anObject
]

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	| theUser |
	theUser := Usuario nuevoConNombre: usuario yContrasena: contrasena.
	self model agregarUsuario: theUser.
	self proceedWith: theUser
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [ 
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Registrar nuevo usuario'.
	aCanvas paragraph.
	super renderInputElementsOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerAndLogin ];
		with: 'Registrar'
]
