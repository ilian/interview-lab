# Real-time JupyterLab instance with publicly sharable URL
A container image to run Jupyter Lab with [real-time collaboration][rtc] and exposed to the internet using a free [Cloudflare Tunnel][tunnel].

As characters within notebooks are synchronized in real-time, it makes for a good code interviewing experience at no cost.

[rtc]: https://github.com/jupyterlab/jupyter-collaboration
[tunnel]:https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/

#### Usage
```
docker build -t interview-lab .
docker run interview-lab
```

#### Security considerations
Anyone with access to the Tunnel URL can:
- Access your local network
- Execute arbitrary commands within the container
- Access any files within the container

You can run this container on a disposable VM.
