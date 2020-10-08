#!/usr/bin/env bash

# this is the directory location which contains all of my flutter projects
projects_directory="/Users/usuario/Desktop/Flutter_Automate"

# moving to the projects_directory
cd $projects_directory

pwd

# creating a new flutter project
flutter create $1

# remving the default main.dart file
rm $1/lib/main.dart
echo "Removed main.dart"

# copying the main.dart template to this project
cp ./main_template.dart $1/lib/main.dart
echo "Added lib/main.dart"

# creating a "views" directory
mkdir $1/lib/views/

# copying the home_screen.dart template to this project
cp ./home_view.dart $1/lib/views/home_view.dart
echo "Added lib/screens/home_screen.dart"
# Removing default pubspec.yaml
rm $1/pubspec.yaml
echo "Removed pubspec.yaml"
#Added New pubspec.yaml
cp ./pubspec.yaml $1/pubspec.yaml
echo "Added Custom pubspec.yaml"

cp ./analysis_options.yaml $1/analysis_options.yaml
echo "Added Custom analysis_options.yaml"

replace=$1
sed "1s/.*/name: $1/" $1/pubspec.yaml>pubspec2.yaml
cat pubspec2.yaml>$1/pubspec.yaml
rm -f pubspec2.yaml

mkdir $1/images

# moving to the location of the newly created flutter project
cd $1/

# inintializing a git repository
git init
git add .
git commit -m "Initial commit"

# launcing the newly created flutter project with the editor of choice
#intellij-idea-community .
code .