echo "This only works with apt :/"

curl -LO https://download.jetbrains.com/idea/ideaIE-2020.3.tar.gz
tar xvf ideaIE-2020.0.3.tar.gz

sudo mv -r ideaIE-203.5981.183/ /opt/
sudo ln -sf /opt/ideaIE-203.5981.183/bin/idea.sh /bin/idea

echo "Done! You can now run 'idea' to start up IntelliJ."
echo "    Installed to /opt/ideaIE-203.5981.183/"

read -p "" gitname
