echo "Be sure you have set up a remote git repo somewhere like github/lab"
echo "[Note] Ed's upload speed is really bad, so this script does not include the cities.tsv.gz file."
echo "Download it manually and copy it into the repo on your own computer to avoid super long wait times."

read -p "Git remote url: " remoteurl
read -p "Git config email: " gitemail
read -p "Git config name: " gitname
read -p "Git username: " gituser
read -p "Git pass: " gitpass

set -x

git init
git config --global user.email $gitemail
git config --global user.name $gitname
git add .
git restore --staged cities.tsv.gz
git commit -m "Add init files"

git remote add HEAD $remoteurl
git push --set-upstream HEAD master
