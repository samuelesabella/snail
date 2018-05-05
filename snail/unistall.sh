if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PROFILE=~/.bashrc
  sed -i "/# snail/d" $PROFILE
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILE=~/.bash_profile
  sed -i ".backup" "/# snail/d" $PROFILE
fi

sed -i ".backup" "/# snail/d" $PROFILE
rm -rf ~/.snail
