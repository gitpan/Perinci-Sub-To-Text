
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Generate text documentation from Rinci function metadata",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Sub-To-Text",
  "dist_version" => "0.25",
  "license" => "perl",
  "module_name" => "Perinci::Sub::To::Text",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Data::Dump::OneLine" => 0,
    "Data::Sah" => "0.15",
    "List::MoreUtils" => 0,
    "Locale::Maketext::Lexicon" => 0,
    "Locale::Maketext::Lexicon::Gettext" => 0,
    "Log::Any" => 0,
    "Moo" => 0,
    "Perinci::Access" => "0.32",
    "Perinci::Access::Perl" => "0.38",
    "Perinci::Object" => "0.11",
    "Rinci" => "v1.1.35",
    "SHARYANTO::Role::Doc::Section" => 0,
    "SHARYANTO::Role::Doc::Section::AddTextLines" => 0,
    "SHARYANTO::Role::I18N" => "0.15",
    "SHARYANTO::Role::I18NRinci" => 0,
    "perl" => "5.010001"
  },
  "script_files" => [],
  "test_requires" => {
    "Capture::Tiny" => 0,
    "Test::More" => "0.88",
    "blib" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
