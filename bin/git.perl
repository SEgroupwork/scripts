#!/usr/bin/env perl

use 5.012;
use Scripts::scriptFunctions;
use POSIX qw/strftime/;
#my $config = conf 'gitpath';

#chdir $config->get ('gitDir');
$ENV{LC_ALL} = 'C';#git变成中文的了,倒不好作了
my @status = `git status`;
my $git = $^O eq 'MSWin32' ? 'F:\\Programs\\Git\\bin\\git.exe' : 'git';
if ($status[-1] =~ /nothing (added )?to commit/) {
    say '本地无更新，自动获取远程更新。';
    system $git, 'pull';
    final;
    exit;
}
@status = grep /:\s+(?!$)/, @status;
if (@status) {
    print "文件:\n@status";
    my $rows = (split /\s/, `stty size`)[0];
    my @diff = grep /\d+m[-+]/, `$git diff`;
    if (@diff < $rows) {
        print "差异:\n @diff";
    } else {
        open LESS, '|-', 'less';
        print LESS @diff;
        close LESS;
    }
    if (!($_ = join ' ', @ARGV))
    {
        say "本地需要提交。请输入提交的注释并回车(空注释将被日期代替):";
        chomp ($_ = <STDIN>);
    }
    if (! $_)
    {
        $_ = strftime '%Y,%-m,%-d (%u) %H,%M,%S', localtime;
    }
    say "提交注释为 $_ 的更新。";
    system $git, 'c', '-m', $_; # git c -> git commit -a
    #system 'git', 'pull';
    system $git, 'p';#use git p instead of git push
    #git p -> git push origin master
    final;
}
