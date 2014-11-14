
use strict;

my($line);
my($threads);
my($size);
my($seq,$par,$libc);
print "Size, Threads, Seq, Par, Libc\n" ;
while($line=<>) {
    chomp $line;
    if($line =~/^Size: ([\d\.]*)$/) {
        $size = $1;
        next;
    } 
    if($line =~/^Threads: ([\d\.]*)$/) {
        $threads = $1;
        next;
    } 
    if($line =~/^Sequential quicksort.*: ([\d\.]*) sec.$/) {
        $seq=$1; next;
    } 
    if($line =~/^Parallel quicksort.*: ([\d\.]*) sec.$/) {
        $par=$1; next;
    } 
    if($line =~/^Built-in quicksort.*: ([\d\.]*) sec.$/) {
        $libc=$1; 
        print "$size, $threads, $seq, $par, $libc\n";
        next;
    }
}
