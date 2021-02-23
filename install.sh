echo "Installing dotfiles..."
pwd=$(pwd)

echo "Compiling c files"
gcc ~/dotfiles/.local/bin/lss.c -o ~/.local/bin/l

echo ".config:"
printf "  %-70s -> %-25s\n" "File Name" "Link Destination"
find .config -type f | while read fname; do
  eval frpath="$pwd/$fname"
  eval topath="~/$fname"

  printf "  %-70s -> %-25s\n" "Creating symlink for file $fname:" "$topath"

  ln -sf $frpath $topath
done

echo ".local:"
printf "  %-70s -> %-25s\n" "File Name" "Link Destination"
find .local/bin -type f | while read fname; do
  fNameNoExt=${fname%.sh}
  fNameNoPath=$(basename "$fname")
  fNameNoExtNoPath=$(basename "$truncatedFname")
  eval frpath="$pwd/$fname"
  eval topath="~/$fNameNoExt"

  printf "  %-70s -> %-25s\n" "Creating symlink for script $fNameNoPath ($fNameNoExtNoPath):" "$topath"
  chmod u+x $frpath

  ln -sf $frpath $topath
done
