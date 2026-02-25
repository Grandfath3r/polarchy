sudo mkdir -p /etc/systemd/system.conf.d
sudo cp "$POLARCHY_PATH/default/systemd/faster-shutdown.conf" /etc/systemd/system.conf.d/10-faster-shutdown.conf
sudo systemctl daemon-reload
