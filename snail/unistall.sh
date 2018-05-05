if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PROFILE=~/.bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILE=~/.bash_profile
fi

sed "/# snail/d" $PROFILE > $PROFILE
rm -rf ~/.snail
