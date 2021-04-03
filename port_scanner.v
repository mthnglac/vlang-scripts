import os
import net

fn main() {
	mut remote_ip := ""

	if os.args.len < 2 {
		remote_ip = '127.0.0.1'
	} else {
		remote_ip = os.args[1]
	}

	ports := {
		'http': 80,
		'https': 443,
		'dns': 53,
		'ftp': 20,
		'ftp2': 21,
		'ipp': 631,
	}
	for key, value in ports {
		conn := net.dial_tcp("$remote_ip:$value") or { continue }
		if ip := conn.peer_ip() {
			println("$key -> $value ${ip}")
		} else {

		}

		conn.close()
	}
}
