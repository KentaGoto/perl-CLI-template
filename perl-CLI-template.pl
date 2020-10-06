use strict;
use warnings;
use utf8;


# Receive the directory path
print "Dir: ";
chomp( my $dir = <STDIN> );
$dir =~ s{^"}{};
$dir =~ s{"$}{};

# If the specified directory is directly under the drive, 
# you will get a warning and be finished. 
&dir_check( \$dir );

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

