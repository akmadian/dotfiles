#dir="${$1:=.}" # Set dir to work on to . if not set

#ls_res=$(ls -lah $1)
#du_res=$(du -h --max-depth 1 $1)
#printf "$ls_res\n"
#printf "$du_res\n"

#for i in "$(ls -lah $1)"; do
#  printf "LINE: $i\n"
#done
CYAN='\033[0;36m'
BLUE='\033[0;34m'
ORANGE='\033[0;33m'
LIGHTGREEN='\033[1;32m'

NC='\033[0m'
BOLD='\033[1m'

remove_dot_and_dotdot_dirs()
{
    sed \
      -e 's/^[.]\{1,2\}\x00//' \
      -e 's/\x00[.]\{1,2\}\x00/\x00/g'
}

remove_leading_dotslash()
{
    sed \
      -e 's/^[.]\///' \
      -e 's/\x00[.]\//\x00/g'
}

dir="${1:-.}"
printf "Total Size of %s: %s\n" "$dir" "$(du -h --max-depth 1 $dir | tail -n1 | awk '{print $1}')"
printf "%-6s %-10s %-60s\n" "Size" "Type" "Name"

find $dir -maxdepth 1 -print0 | sort -z | remove_dot_and_dotdot_dirs | remove_leading_dotslash |
  while read -d "" file
  do
  #lenprefix=$(echo -n $dir | wc -m)
  #filenolead=$(echo $file | sed "s/^.\{$lenprefix\}//")
  size=""

  stat_out=$(stat --format='%F %n %N' "$file")

  ftype=$(echo $stat_out | awk '{print $1}')
  fname=""
  if [ "$ftype" == "directory" ]; then
    size=$(du -h $file | tail -n1 | awk '{print $1}')
    fname=$(echo $stat_out | awk '{ printf "\033[1;34m\033[1m%s\033[0m/", $2 }')
  elif [ "$ftype" == "symbolic" ]; then
    size=$(du -h $file | awk '{print $1}')
    fname=$(echo $stat_out | awk '{ printf "\033[0;36m\033[1m%s\033[0m -> %s", $3, $6 }')
  elif [ "$ftype" == "regular" ]; then
    size=$(du -h $file | awk '{print $1}')
    fname=$(echo $stat_out | awk '{ printf "\033[0;32m\033[1m%s\033[0m*", $3 }')
  fi

  printf "%-6s %-10s %-60s\n" "$size" "$ftype" "$fname"
done
