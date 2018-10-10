# Snail - beta
A very simple tool for a very good looking PS1 variable.


## Installation
### Step 1
Once you've download the repo, enter the directory and run the installer by
typing:
```
$ bash install.sh
```

### Step 2 (macOS)
A new Terminal window should be opened. Go to
**"Terminal>Preferences>Profiles"** and set *snail* as default profile. Go to
**"Terminal>Preferences>General"** and set: **"On startup open new Terminal
with > snail"**, **"New windows open with > same profile"*, *"New tabs open
with > same profile"**

### Step 2 (Linux)
Go to **"edit>Profile Preferences"** and change the font into *FiraCode*, then
set yourself a good looking color scheme (next update will provide automatic
import of profiles).


## Uninstallation
Open Terminal and type:
```
$ goodbyesnail
```
(The most beautiful things are the easiest one)


## Customization
Snail offers two type of customization: themes and greetings. Greetings are
what the terminal will show once opened. To change greetings, just edit the
file **"~/.snail/greetings.snail"**. To change the *PS1* format edit the
**~/.snail/theme.snail** file. More details on how the theming works can be
found inside that file.


## Under the hood
The installer will modify the **~/.bash_profile** file by adding function for
parsing themes and creating nice looking **PS1** variables. Snail will also add
a **.snail** folder, inside the user folder, needed for managing uninstallation
scripts and theming files.
