Object subclass: #Curl.

Curl comment:
  'A basic Curl unix wrapper'.

Curl class extend [
  new [ ^(super new) init. ]

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
  |host url uri data query port protocol|

  init [
    host      := ''.
    url       := ''.
    uri       := ''.
    data      := Dictionary new.
    query     := '?'.
    port      := 0.
    protocol  := 'http'.

    ^self.
  ]

  setPort: aPort [
    port := aPort.
    ^self.
  ]

  data [
    ^data.
  ]

  setQuery: key and: value [
    (query == nil) ifTrue: [
      query := key.
      (value size > 0) ifTrue: [
        query := query, '=', value.
      ]
    ] ifFalse: [
      (query size == 1) ifTrue: [
        query := query, key, '=', value.
      ] ifFalse: [
        query := query, '&', key, '=', value.
      ]
    ].

    ^self.
  ]

  setUri: aUri [
    uri := aUri.
    ^self.
  ]

  setHost: aHost [
    host := aHost.
    ^self.
  ]

  request [
    url := protocol, '://', host.

    (port ~= 80 & port > 0) ifTrue: [
        url := url, ':', port asString.
    ].

    (url size > 0) ifTrue: [
      url := url, '/', uri.
    ].

    (query size > 1) ifTrue: [
      url := url, query.
    ].

    ^Curl exec: url.
  ]
]

"Curl request: 'http://localhost:4000/v1/account?apikey=ed19b29410b801f2c7d2e7ff49802a6e734987fbce5b7a024c73652a'."

c := Curl new.
c setHost: 'localhost'.
c setPort: 4000.
c setUri: 'v1/account'.
c setQuery: 'apikey' and: 'ed19b29410b801f2c7d2e7ff49802a6e734987fbce5b7a024c73652a'.
c request.