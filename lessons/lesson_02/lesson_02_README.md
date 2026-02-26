LESSON_02 : REMOTE COMPUTING

Motivation & Purpose 

	- too much data out there for our personal laptops to work with -- need more compute power

	- SOLUTION : use a cluster (many servers networked together, functioning as 1 giant machine)
		- analogy : servers = individual offices (each with own resources) within a cluster (which is the whole building that contains offices)
	
	- 6 of the many uses of HPC (that our personal laptops cannot handle):
		- simulating how propteins folder for drug discovery (soooo many simulations)
		- running climate models to simulate Earth's atmosphere decades into future
		- simulating the Big Bang
		- analyzing whole genome sequencing data for thousands of patients simultaneously
		- training LLMs (enormous amounts of compute)
		- training image recognition systems on millions of images simultaneously
										
Some HPC terms : 

	Parallelism
	Remote computing
	HPC
	CPU
	GPU
	Cores
	Nodes
	Login Nodes
	Compute Nodes
	Scheduler
	HPC Storage
	nano

WM has its own HPC clusters -- SciClone (mostly for A&S) and Chesapeake (for VIMS work)

	- Within SciClone, there are many subclusters -- 2 of them are Bora and Kuro
	- Each has specific use
		 Bora is for multi-node parallel jobs, 20 cores/node, each node runs 1 job at a time
		 Hima (Bora's sibling subcluster) is for serial and shared-memory jobs, many jobs per node if needed
		 Kuro -- check WM HPC Documentation

	- Simplest = Bora , straightforward to request resources
		- only 1 job at a time, and has fixed # of cores (20)
		- one node per job -- don't worry about messing with others' jobs (no sharing complexity)
		- "standard" HPC experience : 
			1) submit job
			2) scheduler finds you a node to run job
			3) job runs
			4) you get emailed the results 

	- What are some projects that can be done using Bora?







Transferring local files (on laptop) onto HPC cluster -- 3 ways to do this :

   1) FileZilla (most visual and beginner-friendly way)

	- FileZilla = file transfer application (on my mac)
	- GUI way of moving files between my laptop and HPC (can also, ofc, use terminal for this)
	- Uses a protocol called SFTP (secure file transfer protocol) -- SSH but for files
		(encrypted and secure in the same way)

	- host = bora, username, password, port = 22 (standard port for SSH/SFTP connections)
	- port = virtual numbered "door" on a computer through which specific type of communication happens
		kind of like a numbered door within the apartment complex (which is host)
		different numbers for different uses : 
			EX port 22	SSH/SFTP 
			EX port 80	HTTP (regular web traffic)
			EX port 443	HTTPS (secure web traffic)
			EX port 25 	Email

	
   2) Command line SFTP (terminal version of what FileZilla does)

	- Use command sftp smlele@bora.sciclone.wm.edu + log in
	- Now, the commands are different
		Can still use cd (navigate) and ls (see what's in working directory)
		No longer a Bash prompt
		Main things to know:
			get 	get a file
			myget	get a bunch of files
			put	send a file	
			myput	send a bunch of files
			bye	quit the sftp connection

   3) Cloning directly from GitHub 

	- Instead of transferring files directly, you push your work to GitHub from laptop
		then log into HPC terminal,and pull changes
	- Cleanest approach -- use GH as middleman

   
   Generally, method 3 is the best for moving things like code and scripts locally to the HPC cluster
	But you're not supposed to interact with large files on GH ... which is why methods 1 and 2 are useful.
	We want to transfer those files directly to HPC, using either FileZilla or SFTP
		EX of use of FileZilla : large files of genomic data!






When transferring files, we often run the risk of corrupting those files (EX some of the data is changed).
This is bad for reproducibility -- for experimental results to be reproducible, we need them to be 100% the same

	- We want to be able to test for this (even if it's somewhat rare)
	- Use a HASH DIGEST (hash function takes a file of any size, produces short string of numbers + letters
		-"fingerprint" of each file
		- even if one character changes, the fingerprint changes completely
		- this is a one-way operation : files generate hash digests, but can't produce file from hash digest
		

	- Use message digest 5 (md5sum) : 
		
		touch myfile.txt
		md5sum myfile.txt 	output : d41d8cd98f00b204e9800998ecf8427e
	
	- compare 2 files on local machine and HPC server : lesson_01_README.md

		md5sum lesson_01_README.md    output: 	d84c6ab8501af87afcc0bcc95b274ece # on local terminal
		md5sum lesson_01_README.md    output: 	d84c6ab8501af87afcc0bcc95b274ece # on HPC

			So the file is the same in both locations! YAY!
		
