### LESSON 1 : SHELL BASICS & REPRODUCIBILITY

Motivation & Purpose

	- With the sheer amount of data to be analyzed, we can no longer just use PC tools(Excel)
	- Want easily reproducible research (without reproducibility, findings are useless)
	- Another merit of reproducibility = easy to revisit and check errors
	- Some ways to make projects more reproducible : 
		- Release code and data for public view (on GitHub)
		- Document everything in lab notebook (or better yet, a EADME)
		- Make figures and stats using scripts (rather than manually, each time)
		- Use code as documentation
		- Don't mess with raw data (settings = "read" only)

	- Good instinct : have a cautious attitutde toward tools/data -- do a lot of testing
	- Use scripts / existing libraries (rather than doing things manually, for example)	  

	Got most of this from : https://gzahn.github.io/binf-data-skills/Media/bds_Ch1.pdf




Creating a project folder with good directory structure -- COMMANDS  :

	
	pwd 			# print working directory
	ls			# see contents (files) in current location 
	cd SUPERCOMPUTING	# move into repository (stored on either mac or bora terminal)
	mkdir lessons		# create lessons folder
	mkdir assignments	# create assignments folder

	mkdir -p lessons/lesson_{01..08} 	# create folders within "lessons" folder
	# -p flag ensures that intermediate directories are created if they're not alr there

	touch lessons/lesson_01/README.md	# create files in specific location
	
	tree			# see a nice skeletal structure of current directory
	nano README.md		# enters the README file I created for each lesson & assignment
				# to exit nano, ^X to exit, ^S to save

Commands to memorize : 

	pwd
	cd
	ls and its flags 
		-l  long format, shows permissions, owner, size, date modified
		-a  show ALL files, including hidden files (start with .)
		-h  human-readable file sizes (like 1K, 2M), used with -l
		-r  reverse sort order
		-t  sort by last modified time
		-R  recursively list subdirectories
	mkdir
	touch
		-c  doesn't create the file if it doesn't already exist
		    (don't accidentally create ghost file from a typo)
	mkdir
		-p  creates intermediate/paremt directories only as needed 
		   	 EX mkdir -p lessson/lesson_08/forfun.txt
		-v  VERBOSE (prints message for each directory created)
		-m  sets permissions/MODE of new directory
			 EX  mkdir -m 755 lesson_08 (755 is executable stuff)

	nano	opens text editor out of terminal, good for READMEs
	
	cat 	prints contents of the file to a terminal
	head	shows first 10 lines of files
	tail 	shows last 10 lines of file
	less 	opens file for scrollable reading (no editing)
	
							
