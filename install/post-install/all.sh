run_logged $POLARCHY_INSTALL/post-install/pacman.sh
source $POLARCHY_INSTALL/post-install/allow-reboot.sh
run_logged sudo $POLARCHY_INSTALL/post-install/secure-boot.sh
source $POLARCHY_INSTALL/post-install/finished.sh