#!/usr/bin/env zsh



if [ $1 -eq ""]
then
	echo "Usage: deploy [comment]"
	exit 0
fi

echo "git deploying..."

hugo

git add .
git commit -m $1
git push -u origin master

cd ../noweaver.github.io/
cp -R ../noweaver/public/* ./

git add .
git commit -m $1
git push -u origin master
