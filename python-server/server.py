import ssl
from http.server import HTTPServer, BaseHTTPRequestHandler
import sqlite3
import json

class RequestHandler(BaseHTTPRequestHandler):

    id = 0
    def _send_response(self, message):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(bytes(message, 'utf8'))

    def _connect_to_db(self):
        self.conn = sqlite3.connect('database.db')
        self.conn.execute('''CREATE TABLE IF NOT EXISTS ENTRIES
                            (ID INT PRIMARY KEY NOT NULL,
                            NAME TEXT NOT NULL,
                            AGE INT NOT NULL);''')
    def _add_entry(self, name, age):
        id = self._get_highest_id() + 1
        self.conn.execute("INSERT INTO ENTRIES (ID, NAME, AGE) VALUES({}, '{}', {})".format(id, name, age))
        self.conn.commit()

    def _search_entry(self, name):
        cursor = self.conn.execute("SELECT * FROM ENTRIES WHERE NAME='{}'".format(name))
        #return cursor.fetchall()
        result = str([{'id': row[0], 'name': row[1], 'age': row[2]} for row in cursor.fetchall()])
        print(result)
        return result.replace("'", '"')

    def do_GET(self):
        self._connect_to_db()
        if self.path.startswith('/api/entry'):
            name = self.path.split('/')[-1]
            result = self._search_entry(name)

            self._send_response(result)#str(result))
        else:
            self._send_response('Hi! I guess now you are on the mainpage of the server \n and now?...')

    def do_POST(self):
        self._connect_to_db()
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length).decode('utf-8')
        if self.path == '/api/entry':
            #name, age = post_data.split(',')
            post_data_dict = json.loads(post_data)
            name = post_data_dict["name"]
            age = post_data_dict["age"]
            print(name, " + ", age, "; \n")
            self._add_entry(name, age)
            self._send_response('Entry added successfully')

    def _get_highest_id(self):
        cursor = self.conn.execute("SELECT MAX(ID) FROM ENTRIES")
        return cursor.fetchone()[0]


#openssl req -new -x509 -days 365 -out certificate.pem -keyout certificate.key
httpd = HTTPServer(('172.25.176.1', 8000), RequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket, certfile='certificate.pem', keyfile='certificate.key', server_side=True)
httpd.serve_forever()
