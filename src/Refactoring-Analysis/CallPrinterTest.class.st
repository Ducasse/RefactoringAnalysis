Class {
	#name : 'CallPrinterTest',
	#superclass : 'TestCase',
	#category : 'Refactoring-Analysis',
	#package : 'Refactoring-Analysis'
}

{ #category : 'tests' }
CallPrinterTest >> testUnary [

	| printer builder |
	builder := Microdown builder. 
	printer := CallPrinter new.
	printer printMethodSignature: (Date class>>#today) into: builder.
	self assert: builder contents equals: 'today()'.
]