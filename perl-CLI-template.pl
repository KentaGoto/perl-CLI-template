use strict;
use warnings;
use utf8;
use File::Find::Rule;
use Encode qw/encode decode/;


# Receive the directory path
print "Dir: ";
chomp( my $dir = <STDIN> );
$dir =~ s{^"}{};
$dir =~ s{"$}{};

# If the specified directory is directly under the drive, 
# you will get a warning and be finished. 
&dir_check( \$dir );

my $file_pattern = '*.txt'; # File pattern (I'm using *.txt as an example here)
my @files = File::Find::Rule->file->name($file_pattern)->in($dir); # Get a file path in recursion
&file_empty_check( \@files ); # Empty check

foreach my $f ( @files ){
	# Write the process you want to do.

	# In the case of Windows, the file path fetched by 
	# File::Find::Rule should be handled by Shift-JIS or CP932. 
	#$f = decode('shift-jis', $f);
	#print encode('shift-jis', $f) ."\n";
	
}

print "\nDone!\nEnter to exit\n";
system ( 'pause > nul' );


# Check to see if it's directly under the drive.
sub dir_check {
	my ( $dir ) = shift;

	if ( $$dir =~ m|^[a-zA-Z]:?(?:\\)?$| ){
		print "WARNING: The drive's nadir cannot be processed\.\n";
		print "Enter to exit\.\n";
		system ( 'pause > nul' );
		exit;
	}
}

# Check if the file is empty.
sub file_empty_check {
	my ( $files ) = @_;

	if ( @$files ){
	
	} else {
		print "The file to be processed was not found\.\n";
		print "Enter to exit\.\n";
		system ('pause > nul');
		exit;
	}
}

