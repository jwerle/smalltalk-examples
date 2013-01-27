Object subclass: #Curl.


CURL_FOLLOWLOCATION := '--location'.

Curl comment:
  'A basic Curl unix wrapper'.

Curl class extend [
  new [ ^(super new) init. ]

  FOLLOWLOCATION  [ ^'--location'. ]
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
  |host url uri data query port protocol opts|

  init [
    host      := ''.
    url       := ''.
    uri       := ''.
    opts      := Dictionary new.
    data      := Dictionary new.
    query     := '?'.
    port      := 0.
    protocol  := 'http'.

    ^self.
  ]

  setOpt: opt and: value [
    opts at: opt put: value.

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

  setUrl: aUrl [
    url := aUrl.
    ^self.
  ]

  setHost: aHost [
    host := aHost.
    ^self.
  ]

  request [
    (url size > 0) ifTrue: [
      url := url
    ] ifFalse: [
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
    ].

    opts keysAndValuesDo: [:opt :value |
      (opt size > 0) ifTrue: [
        url := url, ' ', opt.
        (value size > 0 & value ~= true) ifTrue: [
          url := url, ' ', value.
        ]
      ]
    ].

    ^Curl exec: url.
  ]
]