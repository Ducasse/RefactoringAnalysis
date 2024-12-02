Class {
	#name : 'APIAnalyser',
	#superclass : 'Object',
	#instVars : [
		'builder'
	],
	#category : 'Refactoring-Analysis',
	#package : 'Refactoring-Analysis'
}

{ #category : 'as yet unclassified' }
APIAnalyser >> initialize [

	super initialize.
	builder := Microdown builder.
	
]

{ #category : 'as yet unclassified' }
APIAnalyser >> modelClasses [

	^ { RBMethod . RBClass }
]

{ #category : 'as yet unclassified' }
APIAnalyser >> treatMethod [
	"self new treatMethod" 

	builder header: [ builder text: 'Method API' ] withLevel: 1.
	
	#(#accessing #compiling #'cross reference testing') do: [ :prot |
		builder newLine.
		builder header: [  builder text: prot asString capitalized  ] withLevel: 2.
		
		builder unorderedListDuring: [  
					((RBMethod methodsInProtocol: prot) sorted: #selector ascending) 
						do: [ :each |
						builder item: [
							builder 
								text: each selector.
							each firstComment ifNotEmpty: [ :s | 	
								builder 
									text: ' -- ';
									text: s ] ]
	]]].
	^ builder contents
]
