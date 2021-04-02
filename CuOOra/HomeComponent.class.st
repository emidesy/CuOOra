Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callbacks }
HomeComponent >> createNewPost [
	self call: NewPostComponent new
]

{ #category : #callbacks }
HomeComponent >> findFriend [
	self call: FriendsFinderComponent new
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome ' , self session user nombre.
	"self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	self renderFriendsOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas Unmatched "
]

{ #category : #rendering }
HomeComponent >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user friends do: [ :each | aCanvas listItem: each name ] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Find friends' ]
]

{ #category : #rendering }
HomeComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
HomeComponent >> renderPostsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Posts'.
	aCanvas
		unorderedList: [ self session user postsInNetwork
				do: [ :each | aCanvas listItem: each text ] ].
	aCanvas anchor
		callback: [ self createNewPost ];
		with: [ aCanvas button: 'New post' ]
]
