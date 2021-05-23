module main

import vweb
//import rand

const (
	port = 8082
	default_rate = 1
	default_pitch = 1
)

struct App {
	vweb.Context
mut:
	cnt int
}

fn main() {
	println("Init API on :$port")
	vweb.run<App>(port)
}

pub fn (mut app App) init_once() {
	app.handle_static('.', false)
}

[get]
pub fn (mut app App) index() vweb.Result {
	app.cnt++
	show := true
	numbers := [1, 2, 3]
	app.enable_chunked_transfer(40)
	return $vweb.html()
}

/*[get]
['/users/:user']
pub fn (mut app App) user_endpoint(user string) vweb.Result {
	id := rand.intn(100)
	return app.json('{"$user": $id}')
}

[post]
['/send/:x']
pub fn (mut app App) post(x string) vweb.Result {
	println(x)
	return app.text('Post body: $app.req.data')
}*/