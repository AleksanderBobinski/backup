PROMPT='[ %{$fg_bold[black]%}%c%{$reset_color%} $(git_prompt_info)|${return_code}] '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[gray]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[gray]%})"
return_code='%B%(?.%F{green}.%F{red})%?%f%b'
