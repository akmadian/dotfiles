eval root=$($3)
eval gitm="$root/.gitmodules"
eval gitc="$root/.git/config"

echo "Removing from gitmodules"
eval pattern='/&1/,+3d'
sed -e $pattern $gitm

echo "Staging .gitmodules"
git add .gitmodules

echo "Removing from .git/config"
sed -e $pattern $gitc

echo "Running git rm"
eval pathtocached="$root/$2"
git rm --cached $pathtocached

echo "Running rm rf"
eval gitcache="$root/.git/modules/$2"
rm -rf $gitcache

git commit -m "Removed $1 submodule"

echo "Committed, removing files"
rm -rf $pathtocached
