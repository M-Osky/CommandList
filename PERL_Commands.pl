#!/usr/bin/perl
use strict; use warnings;


						$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
						$$											$$
						$$		PERL COMMANDS, OPERATORS AND SO.	$$
						$$											$$
						$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


	#		Perl will not read anything after this symbol (in the same line), use it for comments
	;		End of command line
	my		If working with use strict, the first time a variable, array, etc appears it must be declaed with my
	$		Defines a variable	my $variable = "cacafuti";

>use warnings; <-# Yes, we want warnings to tell us what is wrong
>use strict; <-# We want each command in a different line with the semicolon ";" and so, also, it will differentiate a global variable from a local variable.

> @Arrays
	Define an array	my @array = ("caca", "futi");
		qw/ /		We can transform a text string in an array (variable per word)	@array = qw/one two three/;
		..		We can define a range of numbers oe letters this way	@array = (a..z);

		$array[0]		To call a variable stored in an array, call the array use the variable symbol ($) and the position of the variable in the array (from 0 to n) between square brackets.
		$array[-1]		To call a variable stored in an array but beginning from the end use negatives (-1 for the last one, -2 for the one before the last, and so).
		scalar		use it to know the size or number of arguments of an array		$size = scalar @array;

		$array[i] = "new";		To add a new value in position "i"
		push (@array, "new last");		Adds an argument at the end of the array
		unshift (@array, "new first");	Adds an argument at the beginning of the array
		pop (@array);		Removes the last element from the array
		shift (@array);		Removes the first element from the array
		$#			use it to see the last introduced argument				$last = $#array;

		my $array_size = scalar (@array);
		
		splice (@array, postition, elements to delete)		Deletes the number of elements specified starting in the position indicated
		splice (@array, position, elements to delete, argument1, argument2, ..., agument n)		Deletes the number of elements specified (can be = 0) and adds the ew arguments specified afterwards.
		
			# With Splice, pop, and shift, we can use it to remove something from  an array (and the original array will now  miss the deleted elements), but we  can also name a new array (@new = splice (@original, 2, 3)) and the new array will contain the deleted parts

		Subset of an @array	->	@months = qw/Jan Feb Mar apr May Jun Jul Aug Sep Oct Nov Dec/;
								@winter = @Months[-1,0,1];
								@summer = @Months[5..7];
		Merge arrays		->	@winterBothHemisf = (@winter, @summer, "other");

		split	to make an @array from a $string
				$year = 'Jan,Feb,Mar,apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec';
				@months = split(',' , $year);
					//		Use this to split every character in a different position
		join	to make a $string from an @array
				@bases_codon = ("C"; "C"; "G");
				$codon = join ('' , @bases_codon);



> %Hashes
	Stores each variable asigned to a key value: key1, value1, key2, value 2, etc.
		Can be defined in many ways:
			my %hash = ('first', 'uno', 'second', 'dos', 'third', 'tres');
			%hash = ('first' => 'uno', 'second' => 'dos', 'third' => 'tres');
			%hash = (first => 'uno', second => 'dos', third => 'tres');
			%hash = ('first', 1, 'second', 2, 'third', 3);
			%hash = (first => 1, second => 2, third => 3);

			$hash{key1}		To call a variable stored in a hash, use the variable symbol($) and the corresponding key value between curly brackets.
			keys		To extract the list of key values: @key_values = keys %hash;
			values		To extract the list of variables: @variables = values %hash;
			Size or number of key-variable pairs	$hashsize = %hash;
			delete		To delete a pair using their key	delete $hash {'key'}

			Subset of a %hash	->	%months = (1,'Jan', 2,'Feb', 3,'Mar', 4,'Apr', 5,'May', 6,'Jun', 7,'Jul', 8,'Aug', 9,'Sep', 10,'Oct', 11,'Nov', 12,'Dec');
									@winter = @months{12,1,2};
			Add pairs: Define a new pair $months {13} = 'NA';
			>Trick: To avoid overwritting:
					if (exists $hash{13}) {print "There is already a 13th mont in the hash\n";}	else {$months {13} = 'NA'; print "NA asigned to key 13\n";}
			map		to convert an array (or anything) in a hash: my %hash = map {$_ => 1} @array;
					will convert any element in the array to a key with value "1", useful for using exists





# Use variables as a variable name

my $varname = "cacafuti";
chomp($varname);
my $varref = eval('\$' . $varname);
$$varref = 42;
print "$cacafuti\n"; # prints "42"






> print		prints in screen the thext specified between quotation marks.	print "you will see this on screen";
				\n		new line: print "Line 1\nline 2";
				\t		tabulation.
				\		Escape symbol. Use it to print symbols that otherwise will not be printed but used
				'$variable'		Use apostrophes to print the name of a variable in despite of its value.
				example: print "The value of the variable '\"$variable\"' is:\t $variable\n";
				String operators
					.	Concatenate: useful to include mathematical operations or some text following a variable
							print "the price of the fruit is " . $number_of_fruits * $fruit_price . "euros\n";
					x	Repeat: multiplies the string: $letter = Z; $letter x 3 = ZZZ;
	# You can print an array with one row per item with a loop
		foreach (@array) {print $FILE "$_\n";} # Print each entry in our array to the file
		close $out; 



> OPERATORS
	Regular operators:
		#		+; -; /; *;
		#		%	gives the remainder ("resto") of a division
		#		**	exponentiation, left number at the power of the right
	
	Assignment: Performs an operation and assigns the value
		Common assignment operators		#		+=; -=; *=; /=; %=; **=
			$i = $i + $k	-->		$i += $k
	Increment (if is only one unit):
		$i = $i + 1		-->		$i += 1		-->		$i++
		$i = $i - 1		-->		$i -= 1		-->		$i--
		The order is important
			my $y = 0; my $x = 1;
			$y = $x++; --> Will first assign the value to $y, and then do the operation (add +1 to $x)
				$y = 1; $x = 2;
			$y = ++$x; --> Will first do the operation (add +1 to $x) and then assign the value to $y
				$y = 2; $x = 2;

	Bitwise operators
		0b	transform the next number from binary to decimal
		0x	transform the next number from decimal to binary
		&	bitwise AND: Copies a bit to the result if it exist in both operands
		|	bitwise OR: Copies a bit to the result if it exist in either of the operands
		^	Bitwise XOR: Copies a bit to the result if it only exists in one of the operands
		~	Bitwise NOT: Inverts all the bits of the operand
		<<	SHIFT LEFT: Moves to the left the bit values the specified number of places, fills with 0 the values on the right
		>>	SHIFT RIGHT: Moves to the right the bit values the specified number of places, fills with 0 the values on the left
			Examples:
			# $x = 		0011 1100 ; #60
			# $y = 		0000 1101 ; #13
			# $x & $y = 0000 1100 ;
			# $x | $y = 0011 1101 ;
			# $x ^ $y = 0011 0001 ;
			# ~$x 	=	1100 0011 ;
			# $x << 2 = 1111 0000 ;
			# $x >> 2 = 0000 1111 ;
		Logical:
			FALSE = 0;
			TRUE = 1;
			and  Returns TRUE if both operands are true, otherwise FALSE
			&&  Returns TRUE if both operands are true, doesn't check second operand if first is false.
			or  Returns TRUE if either of the operands is true, otherwise FALSE
			||  Returns TRUE if either of the operands is true, doesn't check second operand if first is true.
			xor  Returns TRUE if only one of the operands is true, otherwise FALSE
			not  Returns the opposite of the operand, TRUE if false, FALSE if true.
			!  Same, returns TRUE if the operand is false, otherwise FALSE


> REGULAR EXPRESSIONS AND STRING OPERATORS IN PERL
	=~	Binding operator to indicate a string text operation
		// or m/ /		 Match: Returns TRUE if it the text being look for exists in the longer text string
			$reference_long_text_string =~ m/$text_to_look/;
		s///	=~ s/$target/$replacement/		Substitutes with $replacement, the first time it finds $target in text
			$text = "calavera abecedario abanico";		$text =~ s/ab/yz/;		$text -> "calavera yzecedario abanico";
		tr///	=~ tr/$target/$replacement/		Transliterate $target string with $replacement sequence.
			$text = "calavera abecedario abanico";		$text =~ tr/ab/yz/;		$text -> "cylavery yzecedyrio yzynico";
		Modifiers:
	#		i		=~ /text/i		Not case sensitive
	#		.		=~ /te.t/		Wildcard for any ASCII character (te.t = text, test, teat)
	#		\		=~ /\.txt/		Wilcard for any number of characters, equivalent to * in some languages
	#		..		=~ /text../		Matches any ASCII character except end line or new line ("/n")
	#		|		=~ /(text|test)/	or	Returns TRUE if finds either word, does not look more if finds first.
	#		$		=~ /text$/		Exact end. Will match "long_text", but not "text_string".
	#		^		=~ /^text/		Exact beginning. Matches "text_string", but not "long_text".
	#		[]		=~ /te[axs]t/	Matches any combination (teat, text, and test), also Ranges: text[a-z]
	#		!		!~ /text/		returns TRUE if there is no match.
	#		g		=~ s/target/text/g		global, replaces all matches
	#		e		=~ s/target/text/e		exe, evaluates the replace expresion and executes it as Perl code
	#		*		Matches the preceding element as many times as needed
	#		+		Matches the preceding element 1 or more times
	#		?		Matches the preceding element 0 or 1 time
	#		[...]	Matches any single character in the brackets.
	#		[^...]	Matches any single character not in the brackets
	#		{ i}	Matches exactly i number of occurrences of preceding expression.
	#		{ i,}	Matches i or more occurrences of preceding expression.
	#		{ i, k}	Matches at least i and at most k occurrences of preceding expression.
	#		W	Matches nonword characters.
	#		s	Matches whitespace. Equivalent to [tnrf].
	#		S	Matches nonwhitespace.
	#		ºd	Matches digits. Equivalent to [0-9].
	#		\D	Matches nondigits.
	#		A	Matches beginning of string.
	#		Z	Matches end of string. If a newline exists, it matches just before newline (\n).
	#		z	Matches end of string.
	#		G	Matches point where last match finished.
	#		b	Matches word boundaries when outside brackets

	chomp();			Removes the "\n" from the end of the lines
	$line =~ s/\s+$//;	Removes spaces at the end of the line


> CONDITIONALS
	Booleans:FALSE = 0 (number), "0" (text), () (empty array ), and 'undef';
			 TRUE = 1 (binary or boolean);
	exists()	returns TRUE if the value exists,
	
	Numeric
		==		returns TRUE if values are equal
		!=		returns TRUE if values are different
		>		returns TRUE if left value is bigger than right value
		<		returns TRUE if left value is smaller than right value
		>=		returns TRUE if left value is bigger or equal than right value
		<=		returns TRUE if left value is smaller or equal than right value
		<=>		returns -1 if left value is smaller, 0 if equal, or 1 if bigger than right value
	
	String (compares ASCII value)
		eq		returns TRUE if left and right arguments are equal
		ne		returns TRUE if left and right arguments are different
		gt		returns TRUE if left argument is greater than right
		lt		returns TRUE if left argument is less than right
		ge		returns TRUE if left argument is greater or equal than right
		le		returns TRUE if left argument is less or equal than right
		cmp		returns -1 if left argument is less, 0 if equal, or 1 if greater than right
		
¸		#More than one condition can be set with logical OPERATORS

	Conditionals:
		if (condition)	{statement if TRUE} 
		else 			{statement if FALSE}
		
		unless (condition)	{statement if FALSE} else {statement if TRUE}
		
		
		if (condition 1)	{statement if condition 1 is TRUE} 
		elsif (condition 2)	{statement if condition 2 is TRUE}
		elsif (condition 3)	{statement if condition 3 is TRUE}
		else				{statement if al pevious are FALSE}
		
		Shortened:
		>	if (condition) {statement if TRUE} {statement if FALSE}
		>	condition? statement if TRUE : statement if FALSE;
		>	Statement if condition;
		>	Statement unless condition;



> LOOPS
	Statements
		while (tests condition first) Loops if TRUE)
			while ($count <= 5) {print "This is the loop number $count\n"; $count++;}

		until (tests condition first) Loops if FALSE)
			until ($count > 5) {print  "This is the loop number $count\n"; $count++;}

		for (initial state; condition to finish; step) Loops if TRUE
			for ($count = 0; $count > 5; $count++) {print  "This is the loop number $count\n";}

		foreach (loops for all the values of a range)
			foreach $count (0..5) {print  "This is the loop number $count\n";}

		Control statements
			next		jumps to the next loop (advances the loop variable and restarts the loop)
			last		The loop jumps to the end and exits the iterations
			redo		Restarts the same loop, does not advance the variable
			exit if		The loop finishes given a condition
			do			Executes the statement of while or until before checking the condition
				do {while (condition) {statement}}
			<>			Condition used in while or foreach, will loop for each line of a filefield
				foreach (<>) {print "line $i\n"; $i++;} or while (<$file>) {print "line $i\n"; $i++;}



WORKING WITH FILES
	open()	Statement for reading and writting files. With it we temporary assign the filecontents to an object (filehandler)
	open($IN, "<files/filename.txt")
		<		Indicates that we are reading from file
		IN		filehandler: either word with CAPS or a variable $in, $file, etc.
	open($OUT, ">files/filename.txt")
		>		Indicates that we are writting the info from the filehandler (OUT, $out, $file, etc.) to a file
	close()		Once we finish working with the data included in the filehandler we should close it
	Operations with files or filehandlers
	
	#To read all files from a directory
	opendir(DIR, $dirname);
	my @files = readdir(DIR);
	closedir(DIR);
	
	#To rename a file (work with filehandlers)
	use File::Copy qw(move);
	move $in, $out;



> SUBROUTINES
	Definition: define a task that we are going to use several times so we don't need to write it every time. 
		sub subroutine_name {return()}	# statetement with a return function to tell wich value we want it to give when we call it
			Example of subroutine definition:
				sub calc_average {
					my $total_arguments = scalar (@_);
					my $sum = 0;
					foreach my $argument (@_) {$sum += $argument;}
					$average = $sum /$total_arguments;
					return ($average);
				}
	Call: to perform the task previously defined
		subroutine_name ()		We can specify which data it should use between the parenthesis
			Example of subroutine call:
				$av = calc_average (20, 40, 50, 70);
				print $av;



> REFERENCES
	Allow us to create a scalar variable that references any object of any type (arrays, hash, subrutines)
		Saves memory: No need to create two copies of the same variable for different
		Enables subroutines to return values that are not in a scalar or list format. (the reference is a scalar pointer to values that can be in any kind of format)
		Can encapsulate complex data structures comprising of nested arrays, hashes, scalars and more.
		
	To reference objects:
	\		We can use \ to create a reference from an object -> $hashref = \%hash; \@array; or \$scalar;
	To create references directly
		my @array		= (1, 2, 3);
		my $array_ref	= [1, 2, 3]; # Use square brackets to create an array reference
		my %hash		= (one => 1, two => 2, three => 3);
		my $hash_ref	= {one => 1, two => 2, three => 3}; # Use curly brackets to create a hash reference
		
	To de-reference (for example, so we can do mathematical operation with their values)
		We can type the symbol that corresponds before the "$" -> $$scalarref; $@arrayref or $%hashref;
		We can use the corresponding symbol between curly brackets ${]; @{} or %{}
		We can use the arrow "->" to de-reference
			foreach my $purchase_value ( @{ $customer->{last_3_purchase_values} }) {
			print $purchase_value;
			}
			foreach my $key (keys %{ $customer->{phones} }) {
			print $customer->{phones}{$key};
			}
			print $array[1]; #2
			print $array_ref->[1]; #2 
			print $hash{three}; #3
			print $hash_ref->{three}; #3

		Example of nested arrays and hashes:
			my $customer = { name	=> 'Óscar',									# hash reference
							 dob 	=> '16/07/1982',
							 phones	=>	{	home	=> '212-608-5787',
											work	=> '347-558-0352'},				# hash reference nested
							 last_3_purchase_values => [ 78.92, 98.36, 131.00 ],		# array reference nested
							 addresses => [	{	street	=> '37 Allright Ave',		# array reference nested
												zip		=> '11025',
												city	=> 'New York',
												state	=> 'NY',
											}, 
											{	street	=> '23 Broadway',			# hash nested inside the nested array
												zip		=> '10125',
												city	=> 'New York',
												state	=> 'NY',
											},
							] ,
			};
		
		To access the data:
			print $customer->{name}; 						# Óscar
			print $customer->{phones}{home};				# 212-608-5787
			print $customer->{last_3_purchase_values}[0];	# 78.92
			print $customer->{addresses}[1]{street};		# 23 Broadway



> OTHER USEFUL COMMANDS, OPERATORS AND TIPS

@ARGV		An array with all the objects typed in command line (included files)
	$ARGV[0] = first typed object
> int()		Returns the integer (no decimals) of a number

> length()	Returns the lenght of a text string

> sort ()	Sorts lists
	@sorted_list = sort {$a <=> $b} @list; #To sort numerically
	@sorted_list = sort {$a cmp $b} @list; #To sort by ASCII value
	@sorted_list = sort {$b <=> $a} @list; #To sort in inverse order

> Even numbers: if ((($number/2) + int ($number/2)) == $number)

> die()		kills the script and prints in screen a warning, unless some requeriments are reached
	die "this is the warning that will appear if the following condition is not met\n" unless @ARGV > 0

> Count		We can use the transliterator tr/// to count how many changes are made
	my $sequence = "AACTAGCGGAATTCCGACCGT";
	my $count = ($sequence =~ tr/G/G/); #nothing changes in $sequence, but $count  now include how many Gs are (changes made).

> reverse ()	It returns the list of elements in an array or scalar in opposite order

> substr ()		extracts a substring from a string
	We need to specify ($text_string_target, where to start the extraction, how many characters extract);
	my $first5 = substr($sequence, 0, 5);

> printf ()		prints with format.
	We can specify which part of a hash, array or variable we want to print and in which format
	printf "format to print object 1, object 2, object 3...", object 1, object 2, object 3...;
		%s will print the string contained in the variable
		%d will print the digit contained in the hash
		%.nf will print floating point number
			%.4f	Will print 4 decimal places
		printf "%s %d %.4f", $codon, $count{$codon}, $frequency;
> grep ()		Useful as in Unix it reads a list of elements and returns only those that match certain condition
				@newarray = grep {condition} @oldarray;
				

> $_ -> Is a magic variable (can be also done with @_ and %_) corresponds with the variable being used in the loop, or just introduced.

> $! -> Corresponds with an error code. Useful to print if some mistake





##############Perl one liner scripts

# run in unix to check the number of loci (per individual) at populations.structure
perl -lne '@c = split("\t", $_);  @g = @c[2..$#c];$i = @g; print "$c[0]\t$i";' populations.structure


# run in unix to copy all files matching the first element in each row $1 of file psic_list
perl-lne '/^(.*?)\t/; system ("scp /common/ProcData/Lizard/Mapping/bam_psci/$1*\. omiraper\@tannat.srce.hr:/shared/omiraper/lizards/mapping/psic") if $1' psic_list
perl	#say unix to run perl
-lne	#set a loop (n), evaluate the expression (e) and print in screen
'something'		#loop between ''
^(.*?)\t	#any variable that is the first element in line (^= beginning of line) and ends with tabulation
system	to execute
scp /local/directory/to/copy/from/$1\.*
 username\@serveraddress:/target/directory/on/server/		#any file with a name as the first element on each row and a dot, will be copied from local to the server to target server
if $1 filename			# if matches the first element of each row of the file


# rename the list of sample sp to sample pop, by copying the first part of the first column to a second column

perl -lne ' /(.*?)(\d+)/; print "$1$2\t$1"' psic_list > psic_popmap

one liner to rename files from something.sorted.something to something.something
ls | perl -lne '/(.*?)\.sorted\.(.*)/; system ("mv $_ $1.$2")'

#extract the columns with the IDs (first column) and POP (second column, only 2 letters) to a file
perl -lne '/^(.*?)\t(..)\t/; print "$1\t$2"' populations.structure > poplist

#let the ID tags at the beggining and end of the file, making a total of 6 columns of metadata
perl -lne '/^(.*?)\t(..)\t(.*?)$/; print "$1\t$2\t1\t2\t$2\t$1\t$3"' populations.structure > newinput

#copy all folders corresponding with listed samples to the local directory in isabella
perl -lne '/^(.*?)\t/; print ("scp moscar@161.53.185.209: /common/Data/$1") if $1' popmap_octop

#number of columns
perl -lne 'next if /#/; @v = split("\t", $_); $t = @v; print "$t"; last ' populations.structure








# Install perl modules locally using CPAN

First type cpanm
https://perlmaven.com/install-perl-modules-without-root-rights-on-linux-ubuntu-13-10

