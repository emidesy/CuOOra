Class {
	#name : #AccessGrantingComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'contrasena'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
AccessGrantingComponent >> contrasena [
	^ contrasena
]

{ #category : #accessing }
AccessGrantingComponent >> contrasena: anObject [
	contrasena := anObject
]

{ #category : #model }
AccessGrantingComponent >> model [
	^ CuOOra  soleInstance
]

{ #category : #private }
AccessGrantingComponent >> proceedWith: aUser [
	self session user: aUser.
	self call: HomeComponent new
]

{ #category : #rendering }
AccessGrantingComponent >> renderButtonsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #rendering }
AccessGrantingComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #rendering }
AccessGrantingComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Usuario:'.
	aCanvas label: [ aCanvas textInput on: #usuario of: self ].
	aCanvas paragraph.
	aCanvas label: 'Contraseña:'.
	aCanvas label: [ aCanvas passwordInput on: #contrasena of: self ].
	aCanvas paragraph
]

{ #category : #accessing }
AccessGrantingComponent >> usuario [
	^ usuario
]

{ #category : #accessing }
AccessGrantingComponent >> usuario: anObject [
	usuario := anObject
]
