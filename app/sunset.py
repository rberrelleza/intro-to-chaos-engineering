import os

import cherrypy
from cherrypy.process.plugins import Daemonizer, PIDFile
import requests

cur_dir = os.path.abspath(os.path.dirname(__file__))
cert_path = os.path.join(cur_dir, "cert.pem")


class Root:
     @cherrypy.expose
    def index(self, name):
        return "ok"
        
    @cherrypy.expose
    def city(self, name):
        r = requests.post("https://localhost:8444/", timeout=(2, 2), json={
            "city": name
        }, verify=cert_path)

        if r.status_code != 200:
            raise cherrypy.HTTPError(500, r.text)

        cherrypy.response.headers["Content-Type"] = "text/plain"
        print(r.json())
        return "The sunset will occur at {} in {}".format(
            r.json()["sunset"], name
        )


def run():

    cherrypy.config.update({
        "environment": "production",
        "log.error_file" :"sunset.log",
        "server.socket_host": "0.0.0.0",
        "server.socket_port": 8080,
        
    })
    PIDFile(cherrypy.engine, '/var/run/sunset.pid').subscribe()
    Daemonizer(cherrypy.engine).subscribe()
    cherrypy.quickstart(Root())


if __name__ == '__main__':
    run()