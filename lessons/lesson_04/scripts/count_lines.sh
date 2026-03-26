#!/bin/bash

set -ueo pipefail

# count the lines of the first argument to the script
# pipe stdout to cut , removing the filename output

wc -l $1 | cut -f 1 -d " "
# return a number equal to the number of lines in the file

