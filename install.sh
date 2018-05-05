SNAIL=~/.snail

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  PROFILE=~/.bashrc
  FONTDIR=/usr/share/fonts/FiraCode
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PROFILE=~/.bash_profile
  FONTDIR=~/Library/Fonts/FiraCode
  SNAIL_PROFILE="snail.terminal"
fi


if ! grep "# snail" $PROFILE
then
  echo "source ~/.snail/setup.snail # snail" >> $PROFILE
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
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  open snail.terminal
fi
