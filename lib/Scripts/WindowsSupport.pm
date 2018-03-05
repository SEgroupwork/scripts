package Scripts::WindowsSupport;
use 5.012;
use Exporter;
use Encode qw/encode decode/;

our $VERSION = 0.1;
our @ISA = qw/Exporter/;
our @EXPORT_OK = qw//;
our @EXPORT = qw/%winFunc isWindows winPath unixPath setEnv addPathEnv/;

sub isWindows
{
    $^O eq 'MSWin32';
}

sub winPath
{
    my $path = shift;
    $path =~ s{/}{\\}g;
    $path;
}

sub unixPath
{
    my $path = shift;
    $path =~ s{\\}{/}g;
    $path;
}

sub setEnv
{
    my ($name, $value) = @_;
    system 'setx', $name, $value;
}

sub addPathEnv
{
    my ($name, $value) = @_;
    $value = winPath $value;
    my $oldValue = $ENV{$name};
    my @paths = split ';', $oldValue;
    for (@paths) {
        s{[/\\]$}{}g;
        if ((lc winPath $_)
            eq
            (lc $value)) {
            return;
        }
    }
    setEnv $name,
        length $oldValue
        ? ($oldValue . ';' . $value)
        : $value;
}

our %winFunc = (
            ln => sub {
                my ($target, $name) = @_; # use windows-style path
                $target = winPath $target;
                $name = winPath $target;
                my @args;
                @args = ('/D') if -d $target;
                system 'mklink', @args, $name, $target;
            },
            term => sub {
                my $str = join '', @_;
                my $ret;
                eval { $ret = encode 'GBK', decode 'utf-8', $str };
                eval { $ret = encode 'GBK', $str } if $@;
                die "error: $@, @_" if $@;
                $ret;
            }
);

if (isWindows) {
    # 才可以使用终端颜色。
    system '';
}

1;

