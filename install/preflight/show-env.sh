# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(POLARCHY_CHROOT_INSTALL|POLARCHY_ONLINE_INSTALL|POLARCHY_USER_NAME|POLARCHY_USER_EMAIL|USER|HOME|POLARCHY_REPO|POLARCHY_REF|POLARCHY_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
