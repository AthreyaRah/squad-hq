"""Local mock API for DIAG-02 probe 4. Stdlib only. Synthetic data.

Run:  python3 tools/mocks/diag/api_mock.py   (serves http://127.0.0.1:8765)
Stop: Ctrl+C
"""
import json
from http.server import BaseHTTPRequestHandler, HTTPServer

ENTRIES = [
    {"id": "E1", "consultant": "ana", "hours": 7.5, "billable": True},
    {"id": "E2", "consultant": "ben", "hours": 4.0, "billable": True},
    {"id": "E3", "consultant": "cy", "hours": 2.0, "billable": False},
]
calls = {"flaky": 0}


class Handler(BaseHTTPRequestHandler):
    def _send(self, status, body):
        data = json.dumps(body).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def do_GET(self):
        if self.path == "/entries":
            self._send(200, ENTRIES)
        elif self.path == "/flaky":
            calls["flaky"] += 1
            if calls["flaky"] % 2 == 1:
                self._send(503, {"error": "service unavailable"})
            else:
                self._send(200, ENTRIES)
        elif self.path == "/down":
            self._send(500, {"error": "internal server error"})
        else:
            self._send(404, {"error": "not found"})


if __name__ == "__main__":
    print("mock API on http://127.0.0.1:8765  (Ctrl+C to stop)")
    HTTPServer(("127.0.0.1", 8765), Handler).serve_forever()
