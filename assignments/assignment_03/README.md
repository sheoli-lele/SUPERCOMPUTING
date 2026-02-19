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

Q5 : How many header lines contain the word "chromosome"?

	grep -c "chromosome" data/GCF_000001735.4_TAIR10.1_genomic.fna

	-  similar to last question

Q6 : How many nucleotides are in each of the first 3 chromosome sequences?

	grep -A1 "chromosome [123]" data/GCF_000001735.4_TAIR10.1_genomic.fna |
	grep -A1 "chromosome [123]" data/GCF_000001735.4_TAIR10.1_genomic.fna | grep -v ">" | grep -v "^--$" | awk '{print length($0)}'

	- long and complex -- maybe there is some simpler approach??
	- get help with this one later

Q7 : How many nucleotides are in the sequence for 'chromosome 5'?

	grep -A1 "chromosome 5" data/GCF_000001735.4_TAIR10.1_genomic.fna | grep -v ">" | tr -d "\n" | wc -c

	- find line containing "chromosome 5" usingfirst grep command
	- remove header line?
	- remove newline characters
	- as usual, wc -c = count characters

Q8 : How many sequences contain "AAAAAAAAAAAAAAAA"?

	grep -c "AAAAAAAAAAAAAAAA" data/GCF_000001735.4_TAIR10.1_genomic.fna

	- 16 A's = pattern
	- use -c to count matching lines!
	- just 1!

Q9 : If you were to sort the sequences alphabetically, which sequence (header) would be first in that list?

	grep ">" data/GCF_000001735.4_TAIR10.1_genomic.fna | sort

	- grab header lines (using ">")
	- use pipe -- pass headers to next command
	- sort these alphabetically

Q10 : How would you make a new tab-separated version of this file, where the first column is the headers and the second column are the associated sequences?

	tr "\n" "\t" < data/GCF_000001735.4_TAIR10.1_genomic.fna

	- are there other ways to do this??????
	- used Claude's help for this one


### REFLECTION : 
