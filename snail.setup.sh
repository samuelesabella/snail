
# snail
# ----- ----- EASY COLORS ----- ----- #
blk_snail=0
red_snail=1; red_snail_=9
gre_snail=2; gre_snail_=10
pnk_snail=3; pnk_snail_=11
blu_snail=4; blu_snail_=12
orn_snail=5; orn_snail_=13
brw_snail=6; brw_snail_=14
gry_snail=7; gry_snail_=15

# \033 escape code
# [38; foreground color, [48; background
# 5; 2; for rgb mode
# xm where x is the color
reset="\[\033[0m\]"
tail=""
easyColorFg() {
  echo -e "\[\033[38;5;$1m\]$2${reset}"
}

easyColorBg() {
  echo "\[\033[48;5;$1m\]$2${reset}"
}

easyColorBF() {
  local aus="$(easyColorFg $2 "$3")"
  echo "$(easyColorBg $1 "$aus")${reset}"
}

# ----- ----- GREETINGS ----- ----- #
if [ -e ~/.snail/greetings.snail ]
then
  while IFS='' read -r line || [[ -n "$line" ]]; do
      echo "$line"
  done < ~/.snail/greetings.snail
fi


# ----- ----- EASY PS1 ----- ----- #
snail_user="\\u"
snail_workdir="\\w"


# ----- ----- SNAIL ----- ----- #
goodbyeSnail(){
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo bash ~/.snail/unistall.sh
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    sudo sh ~/.snail/unistall.sh
  fi
}

snail_parser() {
  theme="$1"

  colors=(); words=();
  # Preparing colors and words
  for word in $theme; do
    if [[ $word = "("*")" ]]; then
      colors+=($(echo "$word " | tr -d \( | tr -d \)))
    fi
    words+=("$word")
  done
  # Grabbing length
  wordsL=${#words[@]}
  colorsL=${#colors[@]}

  i=0 # words index
  j=0 # colors index
  parsed=""
  # use for loop read all nameservers
  for word in ${words[@]}; do
    if [[ $word = "("*")" ]]; then
      # Color found ==> increase color index
      j=$((j+1))
    elif [[ $word = ">" ]]; then
      # Special treatment for >
      if [[ $i = $(( $wordsL - 1 )) ]]; then
        # Ending tail, need to leave background color and take last foreground color
        parsed+="\$(easyColorFg ${colors[j-1]} $tail)"
      else
        # Inner tail, need to synchronize actual foreground ground color with
        parsed+="\$(easyColorBF ${colors[j]} ${colors[j-1]} $tail)"
      fi
    else
      # Simple word need to set background to actual color
      parsed+="\$(easyColorBg ${colors[j]} ${words[i]})"
    fi
    i=$((i+1))
  done

  echo $parsed
}

if [ -e ~/.snail/theme.snail ]; then
  # Grabbing the theme
  themeline=`grep . ~/.snail/theme.snail | grep -v '#' | head -n 1`

  # Random theme
  if [[ $themeline = "*" ]]; then
    themeline=`grep -n . ~/.snail/theme.snail | grep -v '#' | tail -n +2 | sort -R | head -n1 | grep -oE '^\s*[0-9]+'`
  fi

  theme=`sed -n "${themeline}p" < ~/.snail/theme.snail`
  # Parsing the theme
  parsedtheme=$(snail_parser "$theme")
  aus=$(eval echo $parsedtheme)
  # Expanding and applying
  themeexpansion=$(eval echo $parsedtheme)
  PS1=${themeexpansion}
fi
# endsnail
