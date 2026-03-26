#!/bin/bash

set -ueo pipefail

# assign first variable to filename
target=$1


# count number of lines in file, storing number in variable "lines"
lines=$(wc -l $target)

# store first 3 lines of file in variable "first_three"
first_three=$(head -n 3 $target)

# print both
echo "line count : ${lines}"
echo "first 3 lines : ${first_three}"
