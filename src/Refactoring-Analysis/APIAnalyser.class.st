Class {
	#name : 'APIAnalyser',
	#superclass : 'Object',
	#category : 'Refactoring-Analysis',
	#package : 'Refactoring-Analysis'
}

{ #category : 'as yet unclassified' }
APIAnalyser >> modelClasses [

	^ { RBMethod . RBClass }
]

{ #category : 'as yet unclassified' }
APIAnalyser >> treatMethod [
	"self new treatMethod"
	| out builder | 
	builder := Microdown builder.
	out :=  #(#private #printing #'accessing - implementation').
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
