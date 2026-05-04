### LESSON 1 : SHELL BASICS & REPRODUCIBILITY

## Table of Contents

- [Overview](#overview)
- [Git and GitHub](#git-and-github)
- [File Paths](#file-paths)
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

Relative path is better inside scripts because not evenyone has the same file structure because absolute path (/home/users/smlele/SUPERCOMPUTING/lessons/data/data.csv) is hardcoded into the machine ... the moment someoone else clones the repo, it breaks right away. Relative path helps you get stuff "relative to wherever this project lives on your machine that might be and probably is different from mine"

-- 

## Naming Files

Files names that felt normal before are hard to access programmatically because they break command-line scripting Some examples:

- final data set reall final (2) . txt (BAD -- spaces. parenthesis, vague name)
- Data#2.fasta (BAD -- capitalization is inconsistent, can break parsing) 	   							
- results.csv (BAD -- too generic)

Rules for naming files: 

- no spaces (instead, use underscores). Underscores instead of spaces + all-lowercase = snake case 
- what, not how
- specific and descriptive
- no special characters

-- 

## Reproducibility 

Research in science is hardly useful when results cannot be verified or reproduced as true, so reproducibility is the cornerstone of scientific objectivity. It helps us transform a private observtaion (that may have happened just by chance) into a public and verifiable (and MORE universalizable) fact

Rules for Reproducibility : 

- Raw data = sacred (so never overwrite or edit it)
- Code is separate (every transformation of the data lives in a script, and scripts are in their own folder)
- Outputs are disposable (with enough reproducibiity measures, theu can be regenerated fast)
- Document everything (use READMEs etc as lab notebooks)

-- 

## Miscellaneous

What do Git and GitHub replace?

- Before I knew what Git was, I would have files like these in my Downloads folder : "Final.pdf", "Final_REALLY.pdf", "FINAL_FINAL.pdf", "FINAL_SERIOUSLY_FINAL.pdf". Instead of dealing with pains like this, we can save multiple copies of the same file into one repository, with each version included in the commit history 
- Git also allows for collaboration : branching and merging (before, two people working on the same file at once = one person's work is overwritten)
- Git is a good source of truth -- centralized access for anyone on the team, who can go and "clone" the latest version of the project 
- Remote! If your laptop breaks, your work is still stored in a cloud-based backup


More on REPRODUCIBILITY through the lens of Philosophy of Science : 

- [Karl Popper's falsifiability](https://en.wikipedia.org/wiki/Falsifiability) - the idea that what makes something scientific is the ability for it to be proven wrong. Reproducibility is a mechanism for this
- We use inferential statistics and probability, so reproducibility of experiments makes them less likely to be "p-hacked"(https://en.wikipedia.org/wiki/Data_dredging) (finding patterns in random noise)
- Science relies on [inductive reasoning](https://www.scribbr.com/methodology/inductive-reasoning/) : assuming the future will resemble the past if enough instances of a past pattern can be shown
- Reliabilism : reproducibility justifies our belief in a theory because it proves the "process" of discovery is reliable and constant 
- Reproducibility makes for transparency : share the processes that led you to conclusions (like algorithms in the form of scripts) to allow for peer scrutiny

Why are spaces in filenames bad?

- Computers generally use spaces as delimiters (like between arguments, etc), so in a Linux or Bash environment, system interprets space as separator
- EX filename "Resume Final.pdf" ... if you try to rm this, the system wull think you're trying to delete two different files (and also won't be able to find anything)
- Browsers convert spaces to %20 (percent-encoding), so "sheoli lele resume.pdf" becomes "sheoli%20lele%20resume.pdf" (messier for SEO and data scripting)