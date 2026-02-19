### ASSIGNMENT 3 : Exploring DNA sequence file using command line tools


### MISC : 

 -Within my assignments directory in SUPERCOMPUTING repo, I added assignments 4 - 8 : 
	
	mkdir assignments_{04..08}	# brace expansion


### TASK 3 : Answering questions using Unix toold

Q1 : How many sequences are in the FASTA file?

	grep -c ">" data/GCF_000001735.4_TAIR10.1_genomic.fna

        - grep searches a file for lines matching a pattern
        - ">" is the pattern — every sequence in a FASTA file starts with a > header line
        - -c flag counts the matching lines instead of printing them
	- this counts how many > lines exist = how many sequences exists

Q2 : What is the total number of nucleotides (not including header lines or newlines)?

	grep -v ">" data/GCF_000001735.4_TAIR10.1_genomic.fna | tr -d "\n" | wc -c

	- grep -v ">" grabs every line that is NOT a header line (v = inversion)
	- | passes that output to the next command (pipe)
	- tr -d "\n" deletes all newline characters, joining sequences into one string
	- wc -c counts every character in that string
	- result = total nucleotide count!

Q3 : How many total lines are in the file?

	wc -l data/GCF_000001735.4_TAIR10.1_genomic.fna

	- wc = word count tool
	- -l flag = lines (not words)
	- result = total # of lines in file

Q4 : How nay header lines contain the word "mitochondrion"?

	grep -c "mitochondrion" data/GCF_000001735.4_TAIR10.1_genomic.fna

	- grep = lines matching pattern
	- c = counts matching lines (don't just print)
	- just 1 line!
