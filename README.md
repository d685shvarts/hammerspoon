Check out the init.lua file for how the config works

To use the config, you must first use the macro: cmd + ctrl + alt + shift followed by whatever hotkey you want. I've bound cmd + ctrl + alt + shift to caps lock via Karabiner elements, but you can change the macro to whatever you want by changing the "local hyper" variable in the init.lua file. 

Macro + left/right/down/up, moves window to left half, right half, minimize, maximize respectively.

Macro + '1', '2' moves current window to my left screen, and right screen respectively

You can focus any app by pressing macro + any of the applicationHotKeys in init.lua: e.g macro + c, fill focus Google Chrome.

Macro + space gives date/time, battery percentage, ping.

Macro + 'p' will play/pause Spotify, Macro + ']' will play next song on Spotify, Macro + '[' will play previous song on Spotify.

Macro + backspace will lock screen

Macro + end, will shutdown system

Macro + 'w', will arrange apps on two screens with the layout I like. To change this, change the local twoScreenLayout variable.
