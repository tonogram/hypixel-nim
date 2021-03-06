import httpclient

type
  HypixelObject* = object of RootObj ## Root object for the Hypixel API.
  HypixelApiError* = object of IOError ## Exception thrown by errors unique to the Hypixel API.
  HypixelApiBase = object of HypixelObject ## Base object for `HypixelApi` objects.
    key*: string
  HypixelApi* = object of HypixelApiBase ## A synchronous HypixelApi object, containing your API key and an HTTP client.
    client*: HttpClient
  AsyncHypixelApi* = object of HypixelApiBase ## An asynchronous HypixelApi object, containing your API key and an async HTTP client.
    client*: AsyncHttpClient

proc newHypixelApi*(token: string): HypixelApi =
  ## Creates a synchronous HypixelApi object, containing your API key and an HTTP client.
  HypixelApi(key: token, client: newHttpClient())

proc newAsyncHypixelApi*(token: string): AsyncHypixelApi =
  ## Creates an asynchronous HypixelApi object, containing your API key and an async HTTP client.
  AsyncHypixelApi(key: token, client: newAsyncHttpClient())