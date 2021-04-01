Class {
	#name : #RegisterComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'CuOOra-ui'
}

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	| theUser |
	theUser := Usuario nuevoConNombre: usuario yContrasena: contrasena.
	self model addUser: theUser.
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
