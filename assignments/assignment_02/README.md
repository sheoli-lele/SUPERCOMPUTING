# ASSIGNMENT_02 : REMOTE COMPUTING

## Table of Contents:

- [Task 1: Workspace Setup](#task-1-workspace-setup)
- [Task 2 : Download Data](#download-data)
- [Task 3 : File Transfer Permissions](#file-transfer-permissions)
- [Task 4 : Verify File Integrity](#verify-file-integrity)
- [Task 5 : Bash Aliases](#bash-aliases)
- [Task 6 : Reflection](#reflection)

## Task 1 : Workspace Setup

```bash
bora 
# put in password
cd SUPERCOMPUTING/assignments/assignment_02
mkdir data # where I'll put the data once I download it
tree # check that directory structure is right
```

## Task 2 : Download Data

Download the files from the[NCBI FTP server](http://ftp.ncbi.nlm.nih.gov), which allows anonymous access (unlike other ftp servers, which require username + password)

Go to genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/

Downloaded these 2: 

1) GCF_000005845.2_ASM584v2_genomic.fna.gz
2) GCF_000005845.2_ASM584v2_genomic.gff.gz

```bash
# download sequence 1 
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
# now sequence 2
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz

# peak at both files
zcat GCF_000005845.2_ASM584v2_genomic.fna.gz | head -n 10
zcat GCF_000005845.2_ASM584v2_genomic.gff.gz | head -n 10

# now, these are in the assignment_02 directory, but we want them in data/
mv *.gz data/
cd data
ls -ahl # verify successful move
```
Now, we want these files unzipped -- we want to reverse the compression (done to make them easier to transport), so the file is more accurate. For example AAAAAAAAAA gets compressed to A10 or something similar, but we don't want this

```bash
# unzip them
gunzip *.gz # this will remove .gz extension
# files should now be .fna and .gff, verify this : 
cd data
ls -l
```

## File Transfer Permissions

Now, we transfer files using FileZilla (the GUI).