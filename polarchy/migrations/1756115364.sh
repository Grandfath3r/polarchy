echo "Replace buggy native Zoom client with webapp"

if polarchy-pkg-present zoom; then
  polarchy-pkg-drop zoom
  polarchy-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
