
use Module::Build;

my $build = Module::Build->new(
	license            => 'perl',
	dist_version       => '1.05',
	dist_author        => 'Sullivan Beck <sbeck@cpan.org>',
	module_name        => 'List::Parseable',
	dist_abstract      => 'routines to work with lists containing a simple language',
	requires           => {
		'perl'                => '5.6.0',
		'Sort::DataTypes'     => '0',
		'Storable'            => '0',
		'Text::Balanced'      => '0',
	},
	build_requires     => {
		'Data::Dumper'        => '0',
		'IO::File'            => '0',
		'Test::More'          => '0',
	},
	build_recommends   => {
		'Test::Pod'           => '0',
		'Test::Pod::Coverage' => '0',
	},
	sign               => 1,
);

$build->create_build_script;
