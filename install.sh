FONTDIR=~/Library/Fonts/FiraCode
SNAIL=~/.snail
PROFILE=~/.bash_profile

if ! grep -Fxq "# snail" $PROFILE
then
  sudo sh -c "cat ./snail.setup.sh >> $PROFILE"
fi

sudo -k

if ! [ -d "$FONTDIR" ]; then
  git clone https://github.com/tonsky/FiraCode
  mv FiraCode/distr/ttf/ $FONTDIR
  rm -rf FiraCode
fi

if ! [ -d "~/.snail" ]
then
  cp -R snail/ ~/.snail
  sudo chown root ~/.snail/unistall.sh
fi

open snail.terminal
