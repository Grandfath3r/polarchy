# Place in ~/.claude/skills since all tools populate from there as well as their own sources
mkdir -p ~/.claude/skills
ln -s $POLARCHY_PATH/default/polarchy-skill ~/.claude/skills/polarchy
