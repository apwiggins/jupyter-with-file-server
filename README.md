jupyter-with-file-server
===
Jupyter notebooks with a static file server

Access the jupyter notebook at http://IP_ADDR:10000.  Use the generated token to login.

build and run
===
To build and run, use the `./run.sh` script.  This will build the container and generate a token needed to login.  The token is provided at the command line and also copied to `token.txt` as a convenience.

### adding python libraries
- python libraries are added by name to requirements.txt.
- Re-run `./run.sh` to add the python libraries to a rebuilt jupyter image.
- Necessarily, a new token will be generated and causes it to be used at the next login.

static fileserver
===
- A static file server to serve up data files is recommended.
- `fileserver.sh` is provided in this directory which serves local files from `${pwd}/files` without authentication.

Example pcap graph
===
There is an example notebook using a pcap file to graph some packet capture statistics
![image](https://github.com/apwiggins/jupyter-with-file-server/assets/7106951/53e4fcb1-baa0-4063-826b-0da470b01cb2)
