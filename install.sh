echo "Installing dotfiles..."
echo ".config dir:"

pwd=$(pwd)

find .config -type f | while read fname; do
  echo "  Creating symlink for file $fname: $pwd/$fname -> ~/$fname"

  eval frpath="$pwd/$fname"
  eval topath="~/$fname"

  ln -sf $frpath $topath
done

#echo "scripts dir:"
#find scripts -type f | while read fname; do
#  truncatedFname=${fname%.sh}
#  echo "  Creating symlink for script $fname ($truncatedFname): $pwd/$fname -> /usr/bin/$truncatedFname"
#
#  eval frpath="$pwd/$fname"
#  eval topath="/usr/bin/$truncatedFname"
#
#  ln -sf $frpath $topath
#done
