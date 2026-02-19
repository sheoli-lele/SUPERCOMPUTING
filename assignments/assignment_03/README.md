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

Working through assignment_3 gave me tools I never could have imagined existed. Learning Unix tools like grep, wc, and tr
-- and that they were built in the earlier days of computing -- helped me understand that processes need not be separate. Stringing them together can make for efficiency. I like the idea of having small, precise, composable pieces that chain together into something powerful. Once I understood this part conceptually, reading a piped command stopped feeling like decoding a foreign language and started feeling like following a logical sequence of instructions. Each tool has a clear job, and the pipe is just the " conveyor belt" between them. Of course, not all of this clicked immediately for me. Questions 6 and 10 struck me as the most difficult. Question 6 asked me to isolate nucleotide counts for the first three chromosome sequences individually, which required thinking about how the file is structured across multiple lines — something a single grep cannot cleanly handle on its own. Question 10 had a similar challenge: reorganizing the file so that each header and its sequence sit side by side in tab-separated columns sounds simple until you realize sequences can span many lines and need to be collapsed first. Both questions pushed beyond pattern-matching into file restructuring, which requires either more advanced tools or clever combinations of what I know. They humbled me, but also showed me exactly where my current skill set ends and where I need to grow. What I'm most interested in, using all of this, is a specific application I kept thinking of when working on this assignment : using these tools to process the behavioral data of AI agents. I'm imaginingsome simulation in which billions of micro-actions -- every decision, choice, "thought" and response an AI agent makes across tens of thousands of experimental trials -- are logged as raw text, the way this genomic data is logged. This data would of course be massive, structured, and repetitive in exactly the way this FASTA file is. The same pipe logic I used here becomes suddenly indispensable: grep to isolate specific action types or decision patterns, wc to count how frequently a behavior occurs across agents, tr and cut to reformat and extract specific fields for statistical analysis. No GUI could handle that volume efficiently ... but the terminal clearly can! What strikes me is that the same tool I used today to search for a string of sixteen A's in a genome could, in principle, be used to search for a recurring decision pattern across billions of agent interactions — the underlying logic is identical. That parallel made these Unix tools feel less like a bioinformatics skill and more like a foundational research tool for anyone working at the intersection of large-scale data and human or artificial behavior.
