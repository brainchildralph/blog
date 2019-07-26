#!/bin/bash

#echo "'${1:+\${1\} not empty and not null}'"
#echo "'${1+\${1\} is not null}'"
#echo "'${1:-\${1\} is empty or null}'"
#echo "'${1-\${1\} is null}'"

( 
  git add . 
  git commit . -m "${1:+${1}}${1:-update}"
  git push origin master
)
