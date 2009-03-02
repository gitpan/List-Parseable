
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'List::Parseable',
	VERSION	         => '1.05',
	($] >= 5.005
	? (ABSTRACT=>'routines to work with lists containing a simple language',
	   AUTHOR  =>'Sullivan Beck (sbeck@cpan.org)')
	: ()),
	'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
        PL_FILES  => {},
	PREREQ_PM => {
		'Sort::DataTypes'     => '0',
		'Storable'            => '0',
		'Text::Balanced'      => '0',
		'Data::Dumper'        => '0',
		'IO::File'            => '0',
		'Test::More'          => '0',
		'Test::Pod'           => '0',
		'Test::Pod::Coverage' => '0',
	},
);
