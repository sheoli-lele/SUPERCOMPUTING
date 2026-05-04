### LESSON 1 : SHELL BASICS & REPRODUCIBILITY

## Table of Contents

- [Overview](#overview)
- [Git and GitHub](#git-and-github)
- [File Paths](#file-paths)
- [Project Directory Design](#project-directory-design)
- [Naming Files](#naming-files)
- [Reproducibility](#reproducibility)
- [Miscellaneous](#miscellaneous)

--- 

## Overview

---
## Git and GitHub

- Git = version control system. Takes "snapshots" of many milestones in a project, can then "push" them from local machine to remote
- GitHub = cloud-based hosting platform for Git

``` bash 
# start in home directory
cd ~ 
# make a folder and move into it
mkdir practice_folder
# make a few dummy files and folders
mkdir data scripts
touch data/raw.fastq scripts hello.sh
# check where we are 
pwd 
ls -l # list all
```

-- 

## File Paths

File Paths are like addresses within a computer (city); everything on a computer is a "file" and each file lives somewhere. The cursor (traveler from out of town) too, in Terminal, is always at some address (which you can find out with "pwd").

Directions to files or directories (folders that files and folders live in) can be either absolute or relative : 

- Absolute Path = full address from the root directory (/home/SUPERCOMPUTING/lessons/lesson_01/)
- Relative Path = address from where you are right now (/data/read.fastq)

Relative path is better inside scripts because not evenyone has the same file structure because absolute path (/home/users/smlele/SUPERCOMPUTING/lessons/data/data.csv) is hardcoded into the machine ... the moment someoone else clones teh repo, it breaks right away. Relative path helps you get stuff "relative to wherever this project lives on your machine that might be and probably is different from mine"

-- 

## Project Directory Design


