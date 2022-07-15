import subprocess
import getopt, sys
import json

from flask import Flask, request, jsonify

app=Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method != 'POST':
        return '''
        <h3 contenteditable="true">美的LUA在线转换</h3>
        <p class="text-left">POST数据举例：</p>
        <pre class="text-left">{"devicelua": "T_0000_DB_14", "direction": "J2C", "data": {"deviceinfo":{"deviceSubType": 33}, "control": {"power": "on"}}}</pre>
        <pre class="text-left">{"devicelua": "T_0000_DB_14", "direction": "C2J", "data": {"deviceinfo":{"deviceSubType": 33}, "msg":{"data":"aa29db0000000000000303000000030520040300000000000000003a0000db34634c00000000000000cf"}}}
        </pre>
        '''
    data = request.get_json()
    return luatrans(data)

def luatrans(data):
    try:
        devicelua = data['devicelua']
        dirction = data['direction']
        jstring = json.dumps(data['data'])
    except:
        return None

    luafile = open(f"/midealua/{devicelua}.lua", "rt")
    luastr = luafile.read()
    luastr = luastr.replace('bit.', 'bit32.')
    #close the input file
    luafile.close()
    luafile = open(f"/midealua/{devicelua}.lua", "wt")
    #overwrite the input file
    luafile.write(luastr)
    luafile.close()

    result = subprocess.check_output(['lua', '-l', 'bit32', '-l', devicelua, '/app/transcode.lua', dirction, jstring])
    if dirction == 'J2C':
        print(f'raw data: {result.decode()}')
        print(f'cmd data: {result.decode()[:-5]}')
        resp = {
            "raw data": result.decode()[:-1],
            "cmd data": result.decode()[:-5]
        }
        return json.dumps(resp)
    elif dirction =='C2J':
        print(json.loads(result.decode()))
        return json.loads(result.decode())

if __name__=="__main__":
    app.run(debug=True, host="0.0.0.0")


