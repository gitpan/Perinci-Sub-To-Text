package Perinci::Sub::To::Text::I18N::en;
use parent qw(Perinci::Sub::To::Text::I18N Perinci::Sub::To::FuncBase::I18N::en);

use Locale::Maketext::Lexicon::Gettext;
our %Lexicon = %{ Locale::Maketext::Lexicon::Gettext->parse(<DATA>) };

our $VERSION = '0.25'; # VERSION

#use Data::Dump; dd \%Lexicon;

1;
# ABSTRACT: English translation for Perinci::To::Text

=pod

=encoding utf-8

=head1 NAME

Perinci::Sub::To::Text::I18N::en - English translation for Perinci::To::Text

=head1 VERSION

version 0.25

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DESCRIPTION

=head1 FUNCTIONS


None are exported by default, but they are exportable.

=cut

__DATA__
msgid  ""
msgstr ""
