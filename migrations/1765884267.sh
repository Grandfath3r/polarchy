echo "Change to openai-codex instead of openai-codex-bin"

if polarchy-pkg-present openai-codex-bin; then
    polarchy-pkg-drop openai-codex-bin
    polarchy-pkg-add openai-codex
fi
