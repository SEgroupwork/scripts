package Scripts::Windy::Util;

use 5.012;
use Exporter;
use Scripts::scriptFunctions;
#use Data::Dumper;
our @ISA = qw/Exporter/;
our @EXPORT = qw/isGroupMsg msgText msgGroupId msgStopping msgSender uid uName isAt/;
our @EXPORT_OK = qw//;

# check whether a msg is a group msg
sub isGroupMsg
{
    my $windy = shift;
    my $msg = shift;
    ref $msg eq 'Mojo::Webqq::Message::Recv::GroupMessage';
}

sub msgText
{
#    print Dumper(@_);
    my $windy = shift;
    my $msg = shift;
    $msg->content;
}

sub msgGroupId
{
    my ($windy, $msg) = @_;
    $msg->group_id;
}

sub msgStopping : lvalue
{
    my ($windy, $msg) = @_;
    $msg->{__stopping__};
}

sub msgSender
{
    my ($windy, $msg) = @_;
    $msg->sender;
}

sub uid
{
    shift->qq;
}

sub uName
{
    shift->displayname;
}

sub isAt
{
    my $windy = shift;
    my $msg = shift;
    $msg->is_at(@_);
}


1;
