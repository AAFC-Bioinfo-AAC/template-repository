#!/bin/bash

# define a function to print the usage or "help" for the Script.

# INSTRUCTIONS: This shell script copies the files in the ABCC_TEMPLATE repository (with the exception of this script)
# and creates a new repository in your HOME containing the template files.
# Make sure you have execution priviledges (chmod +x auto_repo.sh)
# Then run it with the name of the repo of your choice 
# EX: "./auto_repo.sh Sequence" will create a new repository in your HOME named sequence containing the template.

function usage {
    echo Syntax:
    echo " $(basename $0) Repo_Name
    
    Repo_Name: The name of the repository to be created.
    "
    echo
}

function git_template {
    git init
    git add *
    git commit -m "Add template files"

}

if [ $# -ne 1 ]; then
    usage;
    exit 1;
fi 

Repo_Name=$1
Template_Location=$(pwd)
echo "Creating repository: $Repo_Name"

New_Directory=~/"$Repo_Name"

mkdir $New_Directory

for item in "$Template_Location/"*; do
    if [[ "$(basename "$item")" != "$Repo_Name" && "$(basename "$item")" != "auto_repo.sh" ]]; then
        cp -r "$item" $New_Directory
    fi
done

cd $New_Directory

git_template
echo "Repository '$Repo_Name' has been created and initialized!"

