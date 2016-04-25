#!/bin/bash

basedir=$(dirname "$0")
rsc_path=$basedir"/resources/cpp"

if [ $# -lt 2 ]
then
    echo $0 "project_name project_path"
    exit 0
fi

project=$1
path=$2

echo -e "C++ project kickstarter tool"

# setting up folder architecture
echo -e "- Creating folder " $path/srcs
mkdir -p $path/srcs
echo -e "- Creating folder " $path/resources
mkdir -p $path/resources
touch $path/srcs/empty
touch $path/resources/empty

# copy resources
echo -e "- Setting up .gitignore"
cp $rsc_path/C++.gitignore $path/.gitignore
echo -e "- Setting up CmakeLists.txt"
cp $rsc_path/CMakeLists.txt $path/CMakeLists.txt
sed -i "s/%%project_name%%/"$project"/g" $path/CMakeLists.txt
echo -e "- Setting sample project"
cp $rsc_path/main.cpp $path/srcs/main.cpp

# done
echo -e "Done :)"
