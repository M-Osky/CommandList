# UNIX COMMANDS by M.Óscar


pwd	-> Print Working Directory

ls	-> Lists the folders and other items in the directory. We cand add a route at its right which any directory
		Options: -
	#  -l	'$ ls -l' Will list a longer, detailed, vertical list indicating the propierties and rights, owner, bytes, modification time and name, if its a directory, etc.
					  drwxrwxrwx+ 1 Mosky None   0  5 jul  13:12 Folder
					  -rwxr-xr-x  1 Mosky None 105  5 jul  12:43 script.pl
	#  -R	'$ ls -R' Will list all the files in all the directories and subdirectories
	#  -t	'$ ls -t' Will list the files and directories sorted by time (new -> old)
	#  -h	'$ ls -h' Will show the size in other units (MB or GB)
	#  -d	'$ ls -d' Will show only directories
	#  -S	'$ ls -S' Sorted  by file size
	#  -X	'$ ls -X' Sorted by file extension
	#  -r	'$ ls -r' Will reverse the sorting order (z-> a; old -> new; etc.)
	#  -p	'$ ls -p' Will mark with an "/" the directories
	#  -a	'$ ls -a' Will also show hidden files (those that start with a dot -> .hiddenfile )
	#  ..	'$ ls ..' Will list the parent directory
	# -I	'ls -I "*something*" Will list everything but the files including something in their name		ls -I "*.bai" -I "*.bam"
		To know how many files:		ls -l *bai | wc -l	#count all files that end with bai
	
	We can write various options together -> 'ls -lt -c'	detailed list sorted by modification date

cd	-> Change Directory. If we only write "cd" it will send us to the next upper directory
	Operators:
	Add a /path or a directory (no backlash "/" needed if it is in the same working directory)
	..	-> '$ cd ..' Will send you one level up.
	../..	-> '$ cd ../..' Will send you two levels up
	../folder_name	-> '$cd ..' Will send you to a directory in the same parent directory then the derectory you are in now (.. -> up; folder_name -> down)
	/		'$cd /' Will send you to the root (top-most parent) directory
	~		'$cd ~' Is equivalent to '$ cd ' and will send you home
	If we are in Folder1 (Main/Folder1) and we want to go to Folder2, we can use the absolute path '$ cd Main/Folder2' or the relative path '$ cd ../Folder2'

man		Shows the information of any command -> '$ man man'

  | 		Use it to chain different commands and pipe one through others
  >		To save the output to a file (usually the output we see in the screen)
  <  		It is an equivalent use to '$ > '; in this ase '$ <' is "read from file".

[TAB] | --> | Use it to autocomplete commands or directories or filenames. Double press it to see the options available
[UP]  		To acces the recently typed commands
[Ctrl]+[C]	Interrup (luckily) any script running
[Ctrl]+[D]	 similar to "exit" to log out.
[Ctrl]+[Insert]		Copy
[Shift]+[Insert]	Paste

find /dir/to/search -name "file-to-search" -ls


*************************************************************************************

> HANDLE FILES


mkdir	Creates a new directory -> mkdir Folder1
	mkdir -p Folder1/Folder2 -> If we want to create a folder inside a parent directory
rmdir	Safe way to remove directories (only removes empty folders)

touch		create a new file -> '$touch namefile.txt'

nano		Write the name of a file and it will open it (so you can edit it) -> 'nano namedile.txt'	if there is not any file with that name it will create a new one with that name


mv			moves a file to another directory -> '$ mv namefile.txt Directoryname/'
		We can use mv to rename files '$mv Directory1/filename Directory2/newname' <- If Directory1 = Directory2 the file will not move
	  *  -> We can use the "*" as a wild-card that substitutes any number of characters -> s*x = sax, six and sioux
	  ?  -> We can use the "?" as a substitute for any character, one for each possition -> s?x = sax and six

rm		This is the potentially evil comand that could erase every file, not only empty directories, without confirmation or recicle bin.
  -i	It is recommended to use it with the -i option, so it asks for confirmation (answer y / n)
  -r	To remove also directories
  	rm -i Temp/*.txt
  WARNING: Careful when removing files while using "*" without confirmation. It could delete EVERYTHING

cp		We can copy files (like '$ mv' but without removing them from the original location) and we can copy them with a different name in the same location (duplicate)
  -R	Makes a copy of all directories and files at current, in current and in another place specified -> ' cd -R Current/ Backup/' Will copy everything from current to Current and Backup directories, if Backup does not exist it will create a new one.
  	In most of the cases we do not need to specify the current directory (like for '$ ls ') but in other case like copying with cp we can use the dot to refer to the current directory
  WARNING: By default '$ cp ' overwrites without confirmation
	
---

less		As the command '$ more ' the command '$ less filename' allows you to see the contents of a text file (not edit or create), but it has an improved viewer with useful functions
	h		Help with the view and commands
	j		scroll down one line
	k		scroll up one line (only with '$ less'; not with '$ more')
	f		next page/window
	b		previous page/window (only with '$ less')
	/text	Search fordward
	?text	Search backward
	q		exit

cat 		reads files qucik in the command line
	cat -v "WriteHereYourFileName"		shows you the inside of a file, including some possible format errors
		use it with other functions like awk to print outputs in the screen

head		Shows first 10 lines of a file
tail		Shows last 10 lines of a file
	-n		-n number => number of lines we want to see -> head -n 1 file.txt => see the first line
	|		We ca use other commands and pipe the through tail using | to reduce the output shown
		ls -t | tail	-> Will only show the 10 oldest files


**************************************************************************************************


## ALIAS
to change the behaviour by default of some commands: like '$ ls -p' or '$ rm -i -r'
	alias		newcommand='oldcommand -options' -> Assigns a command with options to a new (or the same) command
				Aliases only exist in the current session

#For more permanent solutions we should create a configuration file
Depending on the initialisation type and login session, either .profile, .bashrc, or .bash_profile will be automatically read every time you open a new terminal.
Writting some instructions there with alias and/or changing the home directory could be helpful
	write the code into a txt, save it without the extension
	.		With dot before its name, so It is invisible
	home	At Home/ so It is automatically read on start
	PATH	The PATH environment variable is used by Cygwin applications as a list of directories to search for executable files to run
		# The info will be:
			HOME="/cygdrive/d/Dropbox/WORKING_NOW/BIOINFORMATICS/UNIXyPERL/HOME/USB/Unix_and_Perl_course"	# To use the our usually working directory as home/
			cd $HOME																						# to go there
			PATH=$PATH":$HOME/Code"																			# We add our directory with codes to the files_to_run list, it will look here if we use bash
			export PERL5LIB=$PERL5LIB:$HOME/Code															# add local code directory to Perl library path
			alias ls="ls -p"																				# better display of directories
			alias rm="rm -i -r"
			alias mv="mv -i"
			alias cp="cp -i"																				# to ensure we do not overwrite anything by mistake
			alias cls="clear;ls"																			# new command to keep a clean screen
#In windows usually the .profile is not read for every bash, is the .bashrc
#If .profile is not read on boot, try .bash and if it also does not read it start try saving the info on the .bashrc instead


*********************************************************************************

# COMMANDS AND FUNCTIONS

> Declare variables: Simply write the name of the variable in caps -> VARIABLE=42
$ Call the variables adding the "$" before its name ->  $VARIABLE

echo		send a new line/output to the screen
	 $PATH	to check the PATH in where it is reading the scripts and softwares
	echo command > filetext.txt		# to save it to a file, also to save outputs from a command we random
		 -e "text:\ttext properly formated\n"	#if we want "echo" to properly interpret the backlash formatingqsuv
export PATH=$PATH:/home/directory	to set a different PATH

source .bashrc		sometimes needed to fix "path" if It is reading it from the wrong source



printf		also prints in screen, but more reliable to print texts and control the output

  \n or \r		Some programming languajes (or even the same in different versions) use a different notation for "new line". In unix usually are \n or \r

grep		search text within a file -> grep "text-to_search" filename >> outputfile <- By default only matches patterns on a per line basis.
	-v		invert match: Only shows the lines that DO NOT match the search 
	-i		ignore case
	-c		will show how many lines match, NOT the lines, but the NUMBER of lines that match
	-h		print also the filename
	-H		omit the filename
		*	use with filenname to search in all files
		|	We can use other commands in combination with |
			grep "ABC" file | less		To see the grep output in less viewer that allows to search


#REGULAR EXPRESSIONS:
#Search patterns according to diverse criteria
#we can use them with 'grep'; 'less' (using "/" to search); etc.

		^	At the left of the expression indicates the expression should match at the start of the line
		$	At the right of the expression indicates that the expression should math at the end of the line
		.	Is a wild-card, each point equals for one ascii character
		*	This wild-card finds sequences that match the precedent characters repeated a number of times (including 0), but not other sequences	B*AC = ABABAC; ABAC; but NOT to ABTAC
		.*	The Wild Card: This combo will search for any number of any ascii characters
		\( \)	Parenthesis:	The combination of / \( pattern* \) / \1 is used to "remember" the pattern found and keep it (assigned to "1") so the substitution does not affect it or specifically affects it.
		\1		We can use up to 9 groups of patterns (between "\(pattern\)" and specify different substitutions or actions using numbers from "\1" to "\9"



tr		Transliterate: changes on range of characters for another one (ranges in a character by character process)
	tr file 'A-Z' 'a-z'					#We can use it to change from caps to lower-case
s /	-> The first 's' declares It is a substitution, this command works line by line, as '$ grep' does
	/g	-> The last 'g' declares that it must substitute all matches, not only the first of each line

sed	works with words in strings and line per line
	options: like in perl
		-i -> In place: in the same file
		g  -> Global: all the times it founds the text
		num,$ -> in which line should it start
		Complex examle: sed -i '2,$s/0/-9/g' octop_ref.srt		->	in the same file, starting in line number 2, replace 0 per -9 all the times it founds a 0
		'1d' will remobe the first line, '2,5d' will remove lines 2 to 5

wc		Word Count: Its output gives the number of lines, words and bytes
	wc -l 	#Number of lines in a file

cut		takes a subset of a file
	-f number1, number2	-> Specifies which column/columns to print		cut 1-5 > file (to save the fist 5 columns to a file).

sort		sorts the output (alphabetically by default)
	-n	Will sort numerically
	-k number	will sort based on the column number written
uniq		Only keeps lines from the output that are unique

************************************************************

lOOPS

for VARIABLE in 1 2 3 4 5
do
	stuff1
	stuff2
	done

If we want to  set a range, we need to define the variable min and Max, and set an increment for the variable

MAX=42
for ((i=1; i<=$MAX; i++))
do
	stuff1
done

wget link	#to download
**************************************************************************

source		run the script
bash		run the script from PATH
./			for Unix to execute files that are in the current directory, but not in PATH
top		Real-time view of running system. Displays system summary information and s list of tasks currently being managed Linux
ps		Process Status: Displays current running processes
kill	Requests the termination of a process

chmod		To add permissions or rights to the file, there are three kinds of permissions (read, write, execute) and three users: owners, group, others.
	u=		Permission to you (the user), can also be to (g)roup or (o)thers
		rwx ->	chmod u=rwx, g=rx, o=r file
	777			chmod 754 file		first position is user, second is group and third is others
				4 = read, 2=write, 1=execute -> 4+2+1=7=all, 4+0+1=5=rx, etc...

dos2unix "WriteHereYourFileName"	It transforms a file format from Windows to Unix, hopefully resolving some format problems from Windows users

***************************************************************************


#Genetics files
			FASTA files: One line sequences preceded by a ">"
			GFF files: Location of exons, genes, binding sites etc on a DNA sequence, commontly an entire chromosome
			# GFF have 9 fields sepparated with tab '	', and even if they are empty we need to add a dot'.'
			# 2nd and 3rd fields usually include info on the kind of sequence
			# 4th specifies the possition where the features start (starting coordinate of genes or other sequences)

******************************************

UNIX SERVER (SOLAR GRID ENGINE):

scp serveruser@adress: /path .		-> To copy files from another connected location, the last dot is to copy file localy
scp moscar@161.53.185.209:/common/scripts/faststructure/filename .


$ qrsh
## This makes you jump out of the "entrance" of the servers to a different node, allocated in that new (random) node allows you to work.

$ qsub "WriteHereYourFileName"
## It submits your files to the job queue and put them to run

$ qstat
## To see all jobs in progress

$ qstat -u "Write-Your-User-Name"
## Write your user name (bo1xxx) to see the works in progress of one single user, I'm almost sure you just want to see your runs and no all the other runs in progress
			"*" <- use wildcard to get all users jobs

##The first colums shows a job-ID of six numbers for each one of your runs, and you can also see the name of the file/work in the third column, in the fifth one there is the state of the job.
	> "r"
	## Your work is running!
	>> "qw"
	## Your work is in the waiting queue, you should be patient
	>> "t"
	## You work is in transition, almost ready to start running
	>> "Eqw"
	## Error!! =·(

$ qdel "ID-of-the-Job"
## Write the ID number of the job and it will stop the current running for that job


Default Files
>> e475482.1
	(or)
>>e"ID-of-the-Job"."Number-of-the-Run"
	"e" = Error file of the job.
	"475482" = ID of the job (whatever it was in the table).
	".1" that number after the dot, appears if you are running the same job more than once, it indicates which run is this one, if this run was the first (in that case) or the tenth (.10).
If the file size is 0 Bytes you are lucky, the error file is in blank!

>> o735727.1
The same, but this is the default output file that appears, if you have specified another output file it should be in blank.

#gz files
gzip filetocompress # to zip
gzip -d filetodecompress # to unzip .gz files (extract)
If the files are file.tar.gz after unziping with gunzip you will need to open the tar file
#tar
tar -xvf file.tar
	-x: extract
	-v: verbose
	-f: in folder

#we can try to do both at the same time:
tar -xzvf file.tar.gz
	-z: unzip gz

unzip -a file.zip

wget link	#to download

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

sudo 			#every time it denies permissions to do something, but be careful
	sudo -i		#will allow you to log in as a sudo and then proceed as superuser

exit
## Type this and press Enter to unlog from sudo; do it twice to close the session and the window.

awk		has multiple funtionalities
	cat populations.structure_FINAL.str | awk 'BEGIN{FS="\t"};{print NF}'
	#will output the number of columns (if they are separated by \t in this case) of a file (populations.structure in this case).

screen -D -R -S name		#creates a session that you can name and save, this you can always go back to the moment you were and the last commands and the software outputs will still be there.
							#start a new screen once you log in the server and you could access to your work in progress in any computer. Even if you close the window.
		-r thesamename		# to open a screen previously crearted. Add a "-d" if the screens are busy
			Ctrl+a			#and then "K" to kill the screen
		-ls					# to list all the screens in the same server


#Copy all files from different subdirectories to the same directory
find /shared/omiraper/folder_with_the_files -type f -print0 | xargs -0 mv -t /shared/omiraper/folder_you_want_your_files_to_be


#INSTALL:
If CONFIGURE file
./configure
			--prefix=/home/moscar/bin	#to install locally
This will compile transforming text into binary
make
make install
-> try to call the software where was installed ./software or anywhere /path/software 
	may be necessary to give permissions chmod 

INSTALL UNIX COMPONENTS:
aptitude -help
useful components: m awk, tree, gnuplot
Find which versions are available: p i packagename
Install: aptitude install packagename

#mount the hardrives
sudo   mount /dev/sda1 /bigcommon
 sudo   mount /dev/sdc1 /bigcommon-sec/



Tips:
do not directly compare variables that include "floats" (decimals or floating points numbers) because their values can be not exactly the same,
instead ask if their difference is greater than some small float number

