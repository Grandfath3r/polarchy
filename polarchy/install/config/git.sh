# Set identification from install inputs
if [[ -n "${POLARCHY_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$POLARCHY_USER_NAME"
fi

if [[ -n "${POLARCHY_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$POLARCHY_USER_EMAIL"
fi
