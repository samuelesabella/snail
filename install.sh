SNAIL=~/.snail

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PROFILE=~/.bashrc
  FONTDIR=/usr/share/fonts/FiraCode
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILE=~/.bash_profile
  FONTDIR=~/Library/Fonts/FiraCode
  SNAIL_PROFILE="snail.terminal"
fi


if ! grep -Fxq "# snail" $PROFILE
then
  sudo sh -c "cat ./snail.setup.sh >> $PROFILE"
fi

sudo -k

if ! [ -d "$FONTDIR" ]; then
  git clone https://github.com/tonsky/FiraCode
  sudo mv FiraCode/distr/ttf/ $FONTDIR
  rm -rf FiraCode
fi

if ! [ -d "~/.snail" ]
then
  cp -R snail/ ~/.snail
  sudo chown root ~/.snail/unistall.sh
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  open snail.terminal
fi
