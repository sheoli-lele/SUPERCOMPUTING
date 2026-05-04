# LESSON_02 : REMOTE COMPUTING 

## Table of Contents

-[Intro to HPC](#intro-to-hpc)
-[Creating an Alias](#creating-an-alias)
-[Some HPC Programs](#some-hpc-programs)
-[Transferring Files](#transferring-files)
-[Verifying Files with Hash Digests](#verifying-files-with-hash-digests)
-[Miscellaneous](#miscellaneous)

## Intro to HPC

HPC (high-performance computing) is really just a cluster of ordinary (but nice) servers networked together, functioning like one giant machine. Instead of buying one computer with HUGE amounts of compute, we combine many smaller ones, let them talk over high-speed and high-security connections, and split the work across them

Community resources -- your job is isolated from everyone else who requests these resources, and you now have the resources to tackle problems that otherwise would be out of reach

Some basic parts of the HPC:

- LOGIN NODES = point of entry into HPC, where you connect remotely. Ony for light work like editing files, organizing data, and launching jobs
- COMPUTE NODES = workhorses (each CPU has many cores, different amounts according to the specific cluster) + large memory, and sometimes GPUs. All of these sit idle until a workload manager directs them to a task
- STORAGE = shared file system, accessible from all nodes, usually tiered (tiers based on how fast you need to access things)
- SCHEDULER/WORKLOAD MANAGER = "traffic cop" that decides which jobs run simulateously or one after another, which nodes run when, balancing fairness and efficiency (EX W&M clusters use SLURM)

We use SSH (secure shell) to get into cluster. This is a cryptographic network protocol to operate network services securely over an unsecure network

- Basically, it's most common way for developers to remote;y log into/control a computer or server via command-line

-- 

## Creating an Alias

The standard way to log into the cluster : 
``` bash
ssh smlele@bora.sciclone.wm.edu # after i already have account
# now, type in password
```

Create an ALIAS -- from now on, if i type [alias] into the Terminal, it will assume I just mean the standard login. Do this in the config file (in nano) -- .bashrc (or .zshrc) file. This is just a plain text file that stores settings for a particular program.

```bash 
nano ~/.bashrc
# in the config file, type in : 
alias bora='ssh smlele@bora.sciclone.wm.edu'
exec bash 
bora # see if it works
```

## Some HPC Programs

These are the few you need to get around : 

```bash
whoami # tells you username
pwd # cursor's current location on computer
ls # what's inside the current directory
cd # change directory (location)
env # show current environmental variable values
echo $HOME # displays things to standard output 
```

## Transferring Files

Why not just push everything from your local machine to GitHub, then pull it onto the HPC? 3 problems with this : 

1) File size limits -- GitHub is designed for text-based code, so it limits files larger than 100MB. Most files we'd need the HPC to analyze are FAR larger (like 100 - 300+ GB of raw data)
2) GitHub isn't secure for this kind of thing. Even if they have private repos, GH is a third-party cloud provider
3) HPC data is usually binary (like compiled files, compressed archives, or raw sensor data). GitHub primarily tracks changes to text files (like code)

To solve this problem, we use a different file transfer system. One of them is FileZilla, which is open-source. More on FileZilla: 

- Supports protocols like SFTP (the more secure version of FTP, runs over SSH), so more secure transfer for sensitive data (like medical records or something)
- GUI-based : instead of using commands like scp or rsync in the terminal window, we can drag-and-drop
- Lets you move things regardless of the file size (if the HPC has space)

Can also use command-line FTP (basically the same thing as FileZilla, but  programmatic): 

```bash
sftp smlele@bora.sciclone.wm.edu

get   # get a file
mget  # get a buncha files
put   # send a file
mput  # send a buncha files
bye   # quit the sftp connection
```

## Verifying Files with Hash Digests

When we transfer files, we run the risk of corrupting them. Things like network glithces, incomplete transfers, or subtle corruption (like a few characters changed). A HASH DIGEST is a way to ensure that this doesn't happen. What is a hash digest?

- Has function takes afile of any size, and produces a short string of letters + numbers
- This is the "fingerprint" of the file ; if even one character changes, it is considered a completely different file with a new hash digest

Use md5sum [file] to find the hash digest of a file: 

```bash
# create a new file
nano hello.sh # type something in it
md5sum hello.sh
# output : bfd06796577ca72f95c95f56d262c1cb  hello.sh

# experiment : make the same file, with same content and try it again
nano hello2.sh # type same thing : Hi
# output : 31ebdfce8b77ac49d7f5506dd1495830  hello2.sh
```
So even if two files have the exact same content, they produce different hash digests

## Miscellaneous

More on SSH and how it works 

- SSH = secure tunnel that lets you control one computer from another over internet
- Remote log-in
- Everything is encrypted (data is turned into scrambled code that only the 2 connecting entities can explain)
- Used by tools like SFTP and SCP, which use it to ensure data doesn't get stolen while in transit

FTP versus SFTP. Both are "digital handshakes" : the thing that 2 entities about to connect do before the data transfer begins (includes greeting/explanation of SSH version, agreement on how to encrypt the data so nothing else can intercept). Think of them like ports

- FTP is older, and was built during the era of a smaller/friendlier internet. Uses TCP/IP protocol which uses 2 separate channels to do its job : control channel and data channel

- SFTP is newer, and built for a more hostile/less secure internet. Uses SSH protocol which is encrypted

What is an environmental variable?

- Sticky note for operating system, stays on disk
- Alternate to hard-coding specific details (like username or location of software installation) -- system just stores that info inside a variable 

- EX $PATH -- list in all folders of what files are located
- EX $HOME -- tells programs where your personal files are (/home/users/sheolielle or something)

- We need them because they make our software portable (don't want to hardcode oaths into a script that will be shared with others)
