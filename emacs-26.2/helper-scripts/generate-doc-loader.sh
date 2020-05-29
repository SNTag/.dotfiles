#!/usr/bin/env bash

[[ -d ./files-being-processed]] mkdir ./files-being-processed
cp ./sites-to-config.csv ./files-being-processed/
awk -v RS= '{print > ("./files-being-processed/whatever-" NR ".txt")}' ./files-being-processed/sites-to-config.csv
rm ./files-being-processed/sites-to-config.csv

for f in ./*.doc; do
    ## need to pass file to an Rscript!
done

[[ -d ./output ]] mkdir ./output
rm -r ./files-being-processed/
