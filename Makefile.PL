
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'List::Parseable',
	VERSION	         => '1.04',
	($] >= 5.005
	? (ABSTRACT=>'routines to work with lists containing a simple language',
	   AUTHOR  =>'Sullivan Beck (sbeck@cpan.org)')
	: ()),
	'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
        PL_FILES  => {},
	PREREQ_PM => {
		'Text::Balanced'      => '0',
		'Sort::DataTypes'     => '0',
		'Storable'            => '0',
		'Test::More'          => '0',
		'Test::Pod'           => '0',
		'Test::Pod::Coverage' => '0',
	},
);
