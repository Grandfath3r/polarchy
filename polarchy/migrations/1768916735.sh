echo "Fix microphone gain and audio mixing on Asus ROG laptops"

source "$POLARCHY_PATH/install/config/hardware/fix-asus-rog-mic.sh"
source "$POLARCHY_PATH/install/config/hardware/fix-asus-rog-audio-mixer.sh"

if polarchy-hw-asus-rog; then
  polarchy-restart-pipewire
fi
