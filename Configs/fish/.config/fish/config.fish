set -g fish_greeting

### start Prompt ###
# Starship Prompt
function starship_transient_prompt_func
  starship module character
end
starship init fish | source

# OH My Posh Prompt
# oh-my-posh init fish --config ~/.config/starship-ish.omp.json| source

#if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
#fundle init 