echo "Installing dotfiles..."
pwd=$(pwd)

echo ".config:"
printf "  %-70s %-50s -> %-25s\n" "File Name" "Link Origin" "Link Destination"
find .config -type f | while read fname; do
  eval frpath="$pwd/$fname"
  eval topath="~/$fname"

  printf "  %-70s %-50s -> %-25s\n" "Creating symlink for file $fname:" "$frpath" "$topath"

  ln -sf $frpath $topath
done

echo "\n.local:"
printf "  %-70s %-60s -> %-25s\n" "File Name" "Link Origin" "Link Destination"
find .local/bin -type f | while read fname; do
  fNameNoExt=${fname%.sh}
  fNameNoPath=$(basename "$fname")
  fNameNoExtNoPath=$(basename "$truncatedFname")
  eval frpath="$pwd/$fname"
  eval topath="~/$fNameNoExt"

  printf "  %-70s %-60s -> %-25s\n" "Creating symlink for script $fNameNoPath ($fNameNoExtNoPath):" "$frpath" "$topath"
  chmod u+x $frpath

  ln -sf $frpath $topath
done
