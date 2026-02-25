source $POLARCHY_INSTALL/preflight/guard.sh
source $POLARCHY_INSTALL/preflight/begin.sh
run_logged $POLARCHY_INSTALL/preflight/show-env.sh
run_logged $POLARCHY_INSTALL/preflight/pacman.sh
run_logged $POLARCHY_INSTALL/preflight/migrations.sh
run_logged $POLARCHY_INSTALL/preflight/first-run-mode.sh
run_logged $POLARCHY_INSTALL/preflight/disable-mkinitcpio.sh
