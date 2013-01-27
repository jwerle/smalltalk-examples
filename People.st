Object subclass: #Person.
Person comment: 
  'I am a primitive form of a person'.
Person instanceVariableNames: 
  'name gender age'.

"Person statics"
Person class extend [
  new [|p| 
    p := super new.
    p init.

    ^p
   ]
]

"Person prototype"
Person extend [
  |name gender age|
  init [ <category: 'initialization'>
   name   := nil.
   gender := nil.
   age    := nil.
  ]

  friendlyName [
    ^name
  ]

  printOn: stream [
    <category: 'printing'>
    stream nextPutAll: 
      '-named: ' . name printOn: stream.
    stream nextPutAll: 
      ' -age: ' . age printOn: stream.
    stream nextPutAll: 
      ' -gender: ' . gender printOn: stream.
  ]

  name [
    ^name
  ]
]

Person subclass: #Joe.

Joe extend [
  init [
    name    := 'joe'.
    gender  := 'male'.
    age     := 22.
  ]
]

joe := Joe new.


joe printNl