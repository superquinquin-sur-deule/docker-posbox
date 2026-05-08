#!/usr/bin/python
import json
import sys

import urllib2

req = urllib2.Request("http://localhost:8069/hw_proxy/status_json")
req.add_header("Content-Type", "application/json")
data = json.dumps({"jsonrpc": "2.0", "method": "call", "params": {}, "id": 1})

try:
    response = urllib2.urlopen(req, data)
    res_json = json.loads(response.read())
    print(json.dumps(res_json["result"]))
    sys.exit(0)
except Exception:
    sys.exit(1)
