# Demo notes

This is a port with notes from the draft demo script here: https://docs.google.com/document/d/11QWnLiep4B3F2KOr7kYBNumgYqFVdXf6Jur_7tLTM04/edit

## Offline/isolated demo

Set `WASH_RPC_HOST` for the docker environment to avoid adding a flag for every command.

These commands "work" but it is unclear if the correct links are being made. I am unable to curl or call the actor at the end of the demo.


```
$ wash ctl link wascc.azurecr.io/kvcounter:v1 wascc:keyvalue wascc.azurecr.io/redis:v0.9.2 URL=redis://redis:6379
Advertising link between wascc.azurecr.io/kvcounter:v1 and wascc:key_value ...
Advertised link (wascc.azurecr.io/kvcounter:v1) <-> (wascc:key_value) successfully
```

```
$ wash ctl start provider wascc.azurecr.io/redis:v0.9.2
Starting provider wascc.azurecr.io/redis:v0.9.2 ...
Actor being scheduled on host [host id]
```

```
$ wash ctl link [actor id] wascc:http_server PORT=8080
Advertising link between [actor id] and wascc:http_server ...
Advertised link ([actor id]) <-> (wascc:http_server) successfully
```

```
$ wash ctl start actor wascc.azurecr.io/kvcounter:v1
Actor [actor_id] being scheduled on host [host_id]
```

```
$ wash ctl start provider wascc.azurecr.io/httpsrv:v0.9.2
Starting provider wascc.azurecr.io/httpsrv:latest ...
Provider being scheduled on host [host_id]
```

```
$ curl http://127.0.0.1:8080/mycounter
{"value": 1}
```

## Notes:

- `redis-provider:v1` doesn't exist, though `redis:v0.9.2` does
- `http-server-provider:v1` doesn't exist, though `httpsrv:v0.9.2` does
- No `calculator-demo` artifacts found
- `call [image]` commands don't seem to work. I only ever get "deadline has elapsed" no matter the timeout.
- `link XXX [capability]` doesn't seem to do anything observable
- there is no `links` command
- `wascc:key_value` capability appears to be `wascc:keyvalue` instead
- can not curl localhost:8080 after getting http_server up, no obvious errors reported.
- It is unclear what the correct form for the `link` command is, wash says `link <actor_id> <provider_id> <capability> [config]`, doc shows `link <actor image|actor_id> <capability> [provider image] [config]` as well as `link <actor_id> <capability> <provider_id> [config]`. I couldn't get any combination to work.

