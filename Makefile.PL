use 5.010000;
use strict;
use warnings;
use inc::Module::Install;

version '0.01';
license 'perl';
name 'Task-MetaCPAN-Web';

my $path = 'cpanfile';
open my $fh, '<', $path or die;
while (my $line = <$fh>) {
	chomp $line;
	next if $line =~ /^\s*$/;
	if ($line =~ m{^(?:test_requires|author_requires|requires)\s+'([^']+)'(?:,\s*'([^']+)')?;\s*(?:#.*)?$}) {
		my $module = $1;
		my $version = $2 // '';
		#say $module;
		#say $version;
		# requires 'Starman', '>= 0.4008';
		$version =~ s{>=\s*}{}g; 

		requires $module, $version;
	} else {
		die "Could not parse line '$line'\n";
	}
	#$line =~ s/^test_requires/requires/g;
	#$line =~ s/^author_requires/requires/g;

	
	
}
WriteAll;

