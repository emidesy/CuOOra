"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: 'simple-net'.
application sessionClass: SessionWithUser.

"
Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callbacks }
LoginComponent >> login [
	(self model loginConNombre: usuario yContrasena: contrasena)
		ifNotNil: [ :it | self proceedWith: it ].
	usuario := nil.
	contrasena := nil
]

{ #category : #callbacks }
LoginComponent >> registerNewUser [
	self call: RegisterComponent new
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: 'No tenes cuenta?'.
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Iniciar Sesion'
]

{ #category : #rendering }
LoginComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Crear cuenta'
]
