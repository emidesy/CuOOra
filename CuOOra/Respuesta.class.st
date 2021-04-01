"
Soy una subclase de Post, se representan las respuestas.
    Instance Variables
	pregunta:		<Object>

"
Class {
	#name : #Respuesta,
	#superclass : #Post,
	#instVars : [
		'miPregunta'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Respuesta class >> nuevaConTexto: unTexto usuario: unUsuario pregunta: unaPregunta [
^self new nuevaConTexto: unTexto usuario: unUsuario pregunta: unaPregunta
]

{ #category : #initialization }
Respuesta >> initialize [ 
super initialize .
miPregunta := ''.
]

{ #category : #accessing }
Respuesta >> nuevaConTexto: unTexto usuario: unUsuario pregunta: unaPregunta [
	descripcion := unTexto.
	usuario := unUsuario.
	miPregunta := unaPregunta.
	unaPregunta  agregarRespuesta: self.
	^ self.
]

{ #category : #accessing }
Respuesta >> obtenerMiPregunta [
	^ miPregunta
]
