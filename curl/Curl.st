Object subclass: #Curl.

Curl comment:
  'A basic Curl unix wrapper'.

Curl class extend [
  new [
    ^super new.
  ]

  version [
    Curl exec: '--version'.
  ]
  
  exec: cmd [
    Smalltalk system: 'curl ', cmd.
  ]

  request: url [|c|
    c := super new.
    c setUrl: url.
    ^c request
  ]
]

Curl extend [
  |url|

  url: aUrl [
    url := aUrl
  ]

  query: [:key :value |
    apikey printNl.
  ]

  setUrl: aUrl [
    self url: aUrl
  ]

  request [
    Curl exec: url
  ]
]

"Curl request: 'http://localhost:4000/v1/account?apikey=ed19b29410b801f2c7d2e7ff49802a6e734987fbce5b7a024c73652a'."

c := Curl new.
c setUrl: 'http://localhost:4000/v1/account'.
c query: 'apikey' 'ed19b29410b801f2c7d2e7ff49802a6e734987fbce5b7a024c73652a'.