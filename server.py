import http.server
import socketserver
import json
import time

PORT = 8080

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/sessions':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            sessions = [
                {"id": "1", "name": "VM1", "status": "Running", "uptime": "2h 30m"},
                {"id": "2", "name": "VM2", "status": "Stopped", "uptime": "0m"},
                {"id": "3", "name": "VM3", "status": "Running", "uptime": "5h 15m"}
            ]
            self.wfile.write(json.dumps(sessions).encode())
        else:
            self.send_response(404)
            self.end_headers()

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print("serving at port", PORT)
    httpd.serve_forever()
