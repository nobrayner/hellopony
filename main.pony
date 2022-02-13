actor Main
    let _ping: Ping
    let _pong: Pong

    new create(env: Env) =>
        _ping = Ping(env)
        _pong = Pong(env)
        _ping.pong(_pong)

actor Ping
    var _env: Env

    new create(env: Env) =>
        _env = env

    be pong(pong': Pong) =>
        _env.out.print("Ping!")
        pong'.ping(this)

actor Pong
    var _env: Env

    new create(env: Env) =>
        _env = env

    be ping(ping': Ping) =>
        _env.out.print("Pong!")
        ping'.pong(this)
