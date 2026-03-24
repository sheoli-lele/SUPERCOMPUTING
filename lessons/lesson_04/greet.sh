y#!/bin/bash
set -ueo pipefail

# assign first script parameter to variable "name"
name=$1

# set "name" to catch the stdout appended to "Hello, __"
echo "Hello, $name!"
