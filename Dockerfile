FROM quay.io/jupyter/base-notebook
USER root

# Enable real-time collaboration
RUN mamba install -y jupyter-collaboration

# Install dependencies for use within the notebook
RUN mamba install -y numpy matplotlib

# Download cloudflared
RUN <<EOF
ARCH="$(arch)"
cd /usr/local/bin/
if [ "$ARCH" = "x86_64" ]; then
  wget "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64" -O cloudflared
elif [ "$ARCH" = "arm64" ]; then
  wget "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64" -O cloudflared
fi
chmod +x cloudflared
EOF

USER 1000
CMD cloudflared tunnel --url http://127.0.0.1:8888 & start-notebook.py --ip='*' --NotebookApp.token= --NotebookApp.password=

