Class {
	#name : #FriendsFinderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'searchText'
	],
	#category : #'CuOOra-ui'
}

{ #category : #callbacks }
FriendsFinderComponent >> befriend: anUser [
	self session user befriend: anUser
]

{ #category : #initialization }
FriendsFinderComponent >> initialize [
	super initialize.
	searchText := ''
]

{ #category : #rendering }
FriendsFinderComponent >> renderContentOn: aCanvas [
	self renderSearchFormOn: aCanvas.
	self renderSearchResultsOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button: 'Finish' ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderSearchFormOn: aCanvas [
	aCanvas
		form: [ aCanvas textInput on: #searchText of: self.
			aCanvas space.
			aCanvas submitButton with: 'Search' ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderSearchResultsOn: aCanvas [
	| users |
	searchText ifEmpty: [ ^ self ]. 
	users := SimpleNet soleInstance usersMatchingNamePart: searchText.
	users
		ifEmpty: [ aCanvas
				paragraph: 'Sorry... no matches... no friends for you this time.' ]
		ifNotEmpty:
			[ self renderUsers: users on: aCanvas ]
]

{ #category : #rendering }
FriendsFinderComponent >> renderUsers: users on: aCanvas [
	^ aCanvas
		unorderedList: [ users
				do: [ :each | 
					(self session user canBefriend: each)
						ifTrue: [ aCanvas
								listItem: [ aCanvas
										text: each name;
										space.
									aCanvas anchor
										callback: [ self befriend: each ];
										with: [ aCanvas button: 'Befriend' ] ] ] ] ]
]

{ #category : #accessing }
FriendsFinderComponent >> searchText [
	^ searchText
]

{ #category : #accessing }
FriendsFinderComponent >> searchText: anObject [
	searchText := anObject
]
