direnv hook fish | source

set -g fish_greeting

### start Prompt ###
# Starship Prompt
function starship_transient_prompt_func
  starship module character
end

if type -q starship
  starship init fish | source
else
end 

# OH My Posh Prompt
# oh-my-posh init fish --config ~/.config/starship-ish.omp.json| source

#if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
#fundle init 