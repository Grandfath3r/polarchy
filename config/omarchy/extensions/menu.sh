# Overwrite parts of the polarchy-menu with user-specific submenus.
# See $POLARCHY_PATH/bin/polarchy-menu for functions that can be overwritten.
#
# WARNING: Overwritten functions will obviously not be updated when Polarchy changes.
#
# Example of minimal system menu:
#
# show_system_menu() {
#   case $(menu "System" "  Lock\n󰐥  Shutdown") in
#   *Lock*) polarchy-lock-screen ;;
#   *Shutdown*) polarchy-cmd-shutdown ;;
#   *) back_to show_main_menu ;;
#   esac
# }
# 
# Example of overriding just the about menu action: (Using zsh instead of bash (default))
# 
# show_about() {
#   exec polarchy-launch-or-focus-tui "zsh -c 'fastfetch; read -k 1'"
# }
