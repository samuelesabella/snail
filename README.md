# Snail - beta
A very simple installation for a very nice looking PS1 (macOS only)
#### installation
Once you've download the repo, open Terminal and run the installer with root permissions by typing:
```
$ sudo sh install.sh
```
A new Terminal window should be opened. If so go to *"Terminal>Preferences>Profiles"* and set *snail* as default profile.
#### disinstallation
Open Terminal and type:
```
$ goodbyesnail
```
(The most beautiful things are the easiest one)
#### Customization
Snail offers two type of customization: themes and greetings. Greetings are what the terminal will show once opened. To change greetings, just edit the file *"~/.snail/greetings.snail"*. To change the *PS1* format edit the *~/.snail/theme.snail* file. More details on how the theming works can be found inside that file
#### Under the hoods
The installer will modify the **~/.bash_profile** file by adding function for parsing themes and creating nice looking **PS1** variables. Snail will also add a *.snail* folder, inside the user folder, needed for managing disinstallation scripts and theming files.