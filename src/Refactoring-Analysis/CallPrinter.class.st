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
			^ self ].
	aBuilder text: (sign keywords first copyWithout: $:).
		
	sign keywords allButFirst do: [ :each | aBuilder text: (each capitalized copyWithout: $:) ].
	aBuilder text: '('.
	aCompiledMethod argumentNames 
		do: [ :a | aBuilder text: a asString ]
		separatedBy: [ aBuilder text: ', ' ].
	aBuilder text: ')'.
		
	

]
