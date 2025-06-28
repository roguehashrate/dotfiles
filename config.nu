# Decorations
fastfetch

# Set Defaults
$env.config.show_banner = false
$env.config.buffer_editor = "vim"

# Alias
alias z = cd

def cl [] {
  clear
  ls
}

alias cl = cl

# Starship Prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

