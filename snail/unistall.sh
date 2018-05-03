if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PROFILE=~/.bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILE=~/.bash_profile
fi

cd ~/
sed '/^\# snail/,/\# endsnail/d' $PROFILE > .tmp
mv $PROFILE .profile.backup
mv .tmp $PROFILE
cd -

sudo rm -rf ~/.snail
