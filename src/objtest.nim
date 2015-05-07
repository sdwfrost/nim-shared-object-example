type Client* {.exportc.} = object
  nick*: string
  user*: string
  host*: string

when isMainModule:
  var
    c: Client

  c = Client(nick: "Xena", user: "oper", host: "yolo-swag.com")

  echo c
