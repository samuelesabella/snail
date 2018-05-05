if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PROFILE=~/.bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILE=~/.bash_profile
fi

sed -i ".backup" "/# snail/d" $PROFILE
rm -rf ~/.snail
