Sheoli Lele
02.11.2026
SUPERCOMPUTING , Assignment # 2

##################################################################################################

### REFRESHER ON THE CLASS SO FAR : 

 - my repo (SUPERCOMPUTING) exists in 3 places : locally, on GitHub (remote), and on HPC (remote)
 - use basic commands in Git workflow to ensure that all 3 are "on the same page". Commands:

	- git pull (downloads latest changes from other places onto local machine)
	- git add (moves files to "staging area")
      	- git commit (saves changes with a descriptive message)
	- git push (uploads saved commits to GitHub)
	- git status (see which files have been changed, staged, whether we are up to date, etc)


###################################################################################################

### TASK 1 : Setting up HPC Workspace

	 # Purpose = establish a good hierarchy of directories (nested)
	 # MAJOR DIFFICULTY HERE : I could not get the VPN to work ... so I had to use "jump" connection
  
	 COMMANDS : 
		mkdir -p ~/SUPERCOMPUTING/assignments/assignment_02/data
			# -p flag is for "parents" folders

### TASK 2 : Download genomic data files 

	# Purpose = acquire specific data from NCBI to use in CLI

	COMMANDS:
		wget [URL] # do this on mac, pull into data folder in assignment_02
		.fna.gz and .gff.gz # the two files # .Gzip


	
### TASK 3 : File Transfer Permissions

	# Purpose = safely moving data through security layers + setting up access to this data

	COMMANDS : 
		scp -J smlele@bastion.wm.edu ~/SUPERCOMPUTING/assignments/assignment_02/data/*.gz smlele@bora.sciclone.wm.edu:~/SUPERCOMPUTING/assignments/assignment_02/data/
			# told computer to go through bastion.wm.edu first (bypassed VPN)
	
		scp -J smlele@bastion.wm.edu [local_files]
		smlele@bora.sciclone.wm.edu:[remote_path]
 
		ls -l # inspect initial permissions (bora command)
		chmod 644 * .gz # change permissions to be world-readable (also bora)

 
### TASK 4 : Verifying File Integrity using md5sum

	 # Purpose =  ensure that a very common risk has not occurred : file / data corruption
	 # Do this by using md5sum to create unique hash digests for each file + comparing other file versions
	 # Use genomic data
	 # BELOW are my steps : 


		 1) Navigate to directory (BORA TERMINAL) that contains the genome files (this directory is "data") # HPC 

		 2) Run command md5sum * .gz
			 # generates hash digest for any file in that directory containing ".gz

		 3) Record the two digests, should be one for each file. Here they are : 
			 # c13d459b5caa702ff7e1f26fe44b8ad7 (for .fna)
			 # 2238238dd39e11329547d26ab138be41 (for .gff)

 		 4) Now, do the same on local terminal. Navigate to directory that contains .gz files
			 # in my case, this is /Users/sheolilele/SUPERCOMPUTING/assignments/assignment_02/data

		 5) Run command md5 -r *.gz
			 # different syntax here
			 # BORA USES GNU/LINUX -- comes with coreutils package (use "md5sum"
			 # MY MAC IS BASED ON BSD -- command is "md5"
 
		 6) Record the two digests:
			 # c13d459b5caa702ff7e1f26fe44b8ad7 (for .fna)
			 # 2238238dd39e11329547d26ab138be41 (for .gff)
 
		 7) VERDICT : IF BOTH PAIRS ARE THE SAME, NO CORRUPTION
			 # transfer success despite "jump" connection



### TASK 5 : Bash Aliases
 
	 # Purpose : make various commands easier to access in Bora terminal
	 #  Here are the 3 aliases + what each one does : 

		1) alias u='cd ..;clear;pwd;ls -alFh --group-directories-first'
	
 			1) moves up one directory level
			2) clears terminal screen (don't want to see old output)
			3) prints current location (pwd)
			4) runs long human-readable list including hidden files + permissions

        
       		 2) alias d='cd -;clear;pwd;ls -alFh --group-directories-first'
		
			1) moves you to previous directory
			2) cleans screen
			3) prints current path
			4) gives detailed file list
	

		3) alias ll='ls -alFh --group-directories-first'

			1) version of standard ls command
			2) shows all hidden files (including .bashrc stuff) + file permissions (EX rw-r--r--)
			3) groups folders together = easier to find


	COMMANDS : 

		- nano ~/.bashrc
		- source ~/.bashrc

######################################################################################################

REFLECTION :

Because I was not able to connect to the VPN, I was forced to use a Jump Host configuration.
For this, I had to route my connection through smlele@bastion.wm.edu.
This Bastion server was a middleman I had to employ, and am curious about its complete security.
While the plan was to use FileZilla for drag-and-drop file transfer of the genomic data ...
lack of VPN accesss made this impossible ; I instead used scp (secure copy) in my terminal!
This assignment solidified my understanding of "distributed development" and I struggled!
