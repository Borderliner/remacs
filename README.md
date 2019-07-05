# Remacs
Remacs: Minimalist Emacs keybindings for Vim (WIP)

## About

Remacs is a Vim plugin to integrate Emacs keybindings. If you don't like Emacs because it's too big and a bloatware, but you also like Emacs' keybindings and Vim's simplicity and minimalism, this is for you!

Remacs tries not to get in your way, but you must understand that in order for these keybindings to work, I had to get rid of some bindings that get in the way (e.g. "p", "n" "f" "b" in Normal Mode).

This is still not perfect in any way, and a lot has to be done for it to be productive and universally useful. So try it out and give me your feedbacks.

Currently, these seem to work:


- Word Navigation
- Copy & Pasting
- Alt key binding
- Command-Mode using Alt-x
- Page Navigation
- Undo, Redo

Not implemented yet:


- Search

## Installation

Add `https://github.com/Borderliner/remacs` to your favorite plugin manager. I use Plug, so add it like this:

```
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/Borderliner/remacs'

call plug#end()
```

Then do `:PlugInstall` from Vim. Now you are good to go.


**Important Note**: If you use Tmux, `Control-B` (Tmux command key) in Tmux conflicts with Emacs navigation. So you need to add this to `~/.tmux.conf`:

```
set-option -g prefix M-t
```

This sets Alt-T as Tmux command key. You can change this into anything else.

# Contributaion

Pull requests are highly welcome. Note that this project aims to be very minimal, and integration of complex keybindings are not a goal. Keep this in mind before you send a request.

Made with <3 by Ryan Hajianpour
Incluenced by [Vimacs](https://www.vim.org/scripts/script.php?script_id=300)
