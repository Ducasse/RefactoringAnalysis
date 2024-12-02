Class {
	#name : 'CallPrinter',
	#superclass : 'Object',
	#category : 'Refactoring-Analysis',
	#package : 'Refactoring-Analysis'
}

{ #category : 'printing' }
CallPrinter >> printMethodSignature: aCompiledMethod into: aBuilder [
	" 
	(Point  >> #setX:setY:) argumentNames
	"
	| sign |
	sign := aCompiledMethod selector.
	sign isUnary
		ifTrue: [ 
			aBuilder text: sign asString, '()'.
			^ self ]
	

]
