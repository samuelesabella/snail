cd ~/
sed '/^\# snail/,/\# endsnail/d' .bash_profile > .tmp
mv .bash_profile .bash_profile.backup
mv .tmp .bash_profile
cd -

sudo rm -rf ~/.snail
