package Perinci::Sub::To::FuncBase;

use 5.010;
use Data::Dump::OneLine qw(dump1);
use Log::Any '$log';
use Moo;
use Perinci::Object;
use Perinci::ToUtil;

with 'SHARYANTO::Role::Doc::Section';
with 'SHARYANTO::Role::I18N';
with 'SHARYANTO::Role::I18NRinci';

has meta => (is=>'rw');
has name => (is=>'rw');

our $VERSION = '0.30'; # VERSION

sub BUILD {
    my ($self, $args) = @_;

    $args->{meta} or die "Please specify meta";

    $self->{doc_sections} //= [
        'summary',
        'description',
        'arguments',
        'result',
        'examples',
        'links',
    ];
}

sub before_gen_doc {
    my ($self, %opts) = @_;
    $log->tracef("=> FuncBase's before_gen_doc(opts=%s)", \%opts);

    # initialize hash to store [intermediate] result
    $self->{_doc_res} = {};
}

# provide simple default implementation without any text wrapping. subclass such
# as Perinci::Sub::To::Text will use another implementation, one that supports
# text wrapping for example (provided by
# SHARYANTO::Role::Doc::Section::AddTextLines).
sub add_doc_lines {
    my $self = shift;
    my $opts;
    if (ref($_[0]) eq 'HASH') { $opts = shift }
    $opts //= {};

    my @lines = map { $_ . (/\n\z/s ? "" : "\n") }
        map {/\n/ ? split /\n/ : $_} @_;

    my $indent = $self->doc_indent_str x $self->doc_indent_level;
    push @{$self->doc_lines},
        map {"$indent$_"} @lines;
}

sub gen_doc_section_summary {
    my ($self) = @_;

    my $meta = $self->meta;
    my $dres = $self->{_doc_res};

    my $name = $self->name // $self->langprop($meta, "name") //
        "unnamed_function";
    my $summary = $self->langprop($meta, "summary");

    $dres->{name}    = $name;
    $dres->{summary} = $summary;
}

sub gen_doc_section_description {
    my ($self) = @_;

    my $meta = $self->meta;
    my $dres = $self->{_doc_res};

    $dres->{description} = $self->langprop($meta, "description");
}

sub gen_doc_section_arguments {
    my ($self) = @_;

    my $meta = $self->meta;
    my $dres = $self->{_doc_res};

    # perl term for args, whether '%args' or '@args' etc
    my $aa = $meta->{args_as} // 'hash';
    my $aplt;
    if ($aa eq 'hash') {
        $aplt = '(%args)';
    } elsif ($aa eq 'hashref') {
        $aplt = '(\%args)';
    } elsif ($aa eq 'array') {
        $aplt = '(@args)';
    } elsif ($aa eq 'arrayref') {
        $aplt = '(\@args)';
    } else {
        die "BUG: Unknown value of args_as '$aa'";
    }
    $dres->{args_plterm} = $aplt;

    my $args  = $meta->{args} // {};
    $dres->{args} = {};
    my $raa = $dres->{args};
    for my $name (keys %$args) {
        my $arg = $args->{$name};
        $arg->{default_lang} //= $meta->{default_lang};
        $arg->{schema} //= ['any'=>{}];
        my $s = $arg->{schema};
        my $ra = $raa->{$name} = {schema=>$s};
        $ra->{human_arg} = Perinci::ToUtil::sah2human_short($s);
        if (exists $arg->{default}) {
            $ra->{human_arg_default} = dump1($arg->{default});
        } elsif (defined $s->[1]{default}) {
            $ra->{human_arg_default} = dump1($s->[1]{default});
        }
        $ra->{summary}     = $self->langprop($arg, 'summary');
        $ra->{description} = $self->langprop($arg, 'description');
        $ra->{arg}         = $arg;

        $raa->{$name} = $ra;
    }
}

sub gen_doc_section_result {
    my ($self) = @_;

    my $meta = $self->meta;
    my $dres = $self->{_doc_res};

    $dres->{res_schema} = $meta->{result} ? $meta->{result}{schema} : undef;
    $dres->{res_schema} //= [any => {}];
    $dres->{human_res} = Perinci::ToUtil::sah2human_short($dres->{res_schema});

    my $rn = $meta->{result_naked};
    if ($rn) {
        $dres->{human_ret} = $dres->{human_res};
    } else {
        $dres->{human_ret} = '[status, msg, result, meta]';
    }

    $dres->{res_summary}     = $self->langprop($meta->{result}, "summary");
    $dres->{res_description} = $self->langprop($meta->{result}, "description");
}

sub gen_doc_section_examples {
    # not yet
}

sub gen_doc_section_links {
    # not yet
}

1;
# ABSTRACT: Base class for Perinci::Sub::To::* function documentation generators

__END__

=pod

=encoding UTF-8

=head1 NAME

Perinci::Sub::To::FuncBase - Base class for Perinci::Sub::To::* function documentation generators

=head1 VERSION

version 0.30

=for Pod::Coverage .+

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Perinci-Sub-To-Text>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Perinci-Sub-To-Text>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Perinci-Sub-To-Text>

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
