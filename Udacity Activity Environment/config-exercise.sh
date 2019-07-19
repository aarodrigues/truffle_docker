#!/bin/bash
cd BCND-C6-Exercises
cp ../gitignore.txt .gitignore
branches=$(git branch -r)
echo $branches
filter_one=${branches//"origin/"/}
filter_two=${filter_one//"HEAD -> master"/}
echo $filter_two
array=($filter_two)

for element in "${array[@]}"
do
    echo "$element"
    git checkout $element
    cp ../gitignore.txt .gitignore
    npm install --save-dev truffle-hdwallet-provider@1.0.6
    git add -A
    git commit -m "add truffle-hdwallet-provider@1.0.6"
done