
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Generate an instance of a DBIx::Class::Schema as test database',
  'AUTHOR' => 'Torsten Raudssus <torsten@raudss.us> L<http://raudss.us/>',
  'BUILD_REQUIRES' => {
    'DBIx::Class' => '0.08195',
    'Test::More' => '0.96'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Test-DBIC-Schema-Connector',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Test::DBIC::Schema::Connector',
  'PREREQ_PM' => {
    'Exporter::Lite' => '0.02',
    'File::Temp' => '0.22',
    'SQL::Translator' => '0.11006'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



