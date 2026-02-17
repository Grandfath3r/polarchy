echo "Change polarchy-screenrecord to use gpu-screen-recorder"
polarchy-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
polarchy-pkg-add slurp gpu-screen-recorder
