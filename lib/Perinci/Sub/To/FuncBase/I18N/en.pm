package Perinci::Sub::To::FuncBase::I18N::en;
use base 'Perinci::Sub::To::FuncBase::I18N';

use Locale::Maketext::Lexicon::Gettext;
our %Lexicon = %{ Locale::Maketext::Lexicon::Gettext->parse(<DATA>) };

our $VERSION = '0.28'; # VERSION

#use Data::Dump; dd \%Lexicon;

1;
# ABSTRACT: English translation for Perinci::Sub::To::FuncBase

=pod

=encoding utf-8

=head1 NAME

Perinci::Sub::To::FuncBase::I18N::en - English translation for Perinci::Sub::To::FuncBase

=head1 VERSION

version 0.28

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Perinci-Sub-To-Text>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Perinci-Sub-To-Text>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
http://rt.cpan.org/Public/Dist/Display.html?Name=Perinci-Sub-To-Text

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__DATA__
# tmp: Sah

msgid  "default"
msgstr "default"

# function

msgid  "Arguments"
msgstr "Arguments"

msgid  "General arguments"
msgstr "General arguments"

msgid  "Arguments related to '%1'"
msgstr "Arguments related to '%1'"

msgid  "'*' denotes required arguments"
msgstr "'*' denotes required arguments"

msgid  "Special arguments"
msgstr "Special arguments"

msgid  "Result"
msgstr "Result"

msgid  "Return value"
msgstr "Return value"

msgid  "Returns an enveloped result (an array). First element (status) is an integer containing HTTP status code (200 means OK, 4xx caller error, 5xx function error). Second element (msg) is a string containing error message, or 'OK' if status is 200. Third element (result) is optional, the actual result. Fourth element (meta) is called result metadata and is optional, a hash that contains extra information."
msgstr "Returns an enveloped result (an array). First element (status) is an integer containing HTTP status code (200 means OK, 4xx caller error, 5xx function error). Second element (msg) is a string containing error message, or 'OK' if status is 200. Third element (result) is optional, the actual result. Fourth element (meta) is called result metadata and is optional, a hash that contains extra information."

# function features

# OLD
#msgid  "This function supports undo operation. Please read 'The undo protocol' in Rinci::function specification."
#msgstr "This function supports undo operation. Please read 'The undo protocol' in Rinci::function specification."

# OLD
#msgid  "This function is declared as %1 (%2). Please read the '%1' feature in Rinci::function specification."
#msgid  "This function is declared as %1 (%2). Please read the '%1' feature in Rinci::function specification."

msgid  "This function supports reverse operation."
msgstr "This function supports reverse operation."

msgid  "This function supports undo operation."
msgstr "This function supports undo operation."

msgid  "This function supports dry-run operation."
msgstr "This function supports dry-run operation."

msgid  "This function is pure (produce no side effects)."
msgstr "This function is pure (produce no side effects)."

msgid  "This function is immutable (returns same result for same arguments)."
msgstr "This function is immutable (returns same result for same arguments)."

msgid  "This function is idempotent (repeated invocations with same arguments has the same effect as single invocation)."
msgstr "This function is idempotent (repeated invocations with same arguments has the same effect as single invocation)."

msgid  "This function requires transactions."
msgstr "This function requires transactions."

msgid  "This function can use transactions."
msgstr "This function can use transactions."

msgid  "This function can start a new transaction."
msgstr "This function can start a new transaction."

msgid  "This function can end (commit) transactions."
msgstr "This function can end (commit) transactions."

# test multiline

msgid  ""
"Line 1"
"Line 2"
msgstr ""
"Line 1"
"Line 2"

msgid  "This function dies on error."
msgstr "This function dies on error."
