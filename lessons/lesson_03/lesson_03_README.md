LESSON_03 : STREAMS & REDIRECTION & TEXT TOOLS

PREREQUISITES : 

	- be connected to W&M VPN (called GlobalProtect)
	- be able to log into bora via ssh (I have alias for this, under name "bora")
	- SUPERCOMPUTING repo is clonsed on HPC from GH


##############################################################################################

### Unix and Unix-like systems have this in common : they read from one of 3 "streams" with every move :

	1)  stdin 	(standard input), program's source of data
	2)  stdout	(standard output), program's normal results 
	3)  stderr	(standard error), program's error messages

	What exactly is a "stream"? 

		- Every command we use reads from one of these
		- stdin usually comes from keyboard / stdout and stderr normally print to screen 
		- But powerfully, we can reroute these streams
		- The streams also have names : 0 (stdin), 1 (stdout), and 2 (stderr) 
		- Can also create "nonstandard" streams if we want (4, 5, 6, etc)

	EX command echo "Hello world"

		- program = echo
		- stdin = "Hello world" (from keyboard)
		- stdout = Hello world (printed to screen)
		- stderr = nothing flowed through this stream / empty, but if it existed, it would print to screen)


### Redirecting streams and why that's useful

	- EX instead of just printing stdout to the screen, we can redirect tit to a file

		echo "Hi mom!"			# merely prints to the screen (normal use of stdout)
		echo "Hi mom!" > newfile.txt	# overwrites a file (redirection of stdout)
		echo "Hi mom!" >> newfile.txt	# appends to a file (redirection of stdout)
	
	Ways to redirect: 

		>	redirect stdout to a file (same as 1>)		
			creates file if nonexistent
			if file already exists, OVERWRITES ENTIRE FILE

		2>	redirect stderr to a file 
			creates file is nonexistent
			if existent, OVERWRITES ENTIRE FILE
	
		>>	redirect stdout to a file (same as 1>>)
			creates file if nonexistent
			of exists, APPENDS to file

		2>>	redirect stderr to a file
			creates file if nonexistent
			if exists, APPENDS to file


###########################################################################################################################

COMMANDS : 

	echo "Hi Mom! This is my first redirection!" > newfile.txt	# redirects output to newfile.txt
