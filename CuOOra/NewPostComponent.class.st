Class {
	#name : #NewPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'postText'
	],
	#category : #'CuOOra-ui'
}

{ #category : #callbacks }
NewPostComponent >> post [
	postText ifEmpty: [ ^ self ].
	self session user
		post: (Post text: postText , ' (' , self session user name , ')').
	self answer
]

{ #category : #accessing }
NewPostComponent >> postText [
	^ postText
]

{ #category : #accessing }
NewPostComponent >> postText: anObject [
	postText := anObject
]

{ #category : #rendering }
NewPostComponent >> renderContentOn: aCanvas [
	aCanvas
		form: [ (aCanvas textArea on: #postText of: self)
				columns: 80;
				rows: 5.
			aCanvas break.
			aCanvas submitButton
				callback: [ self post ];
				with: 'Post' ]
]
