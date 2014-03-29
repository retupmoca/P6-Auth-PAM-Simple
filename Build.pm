use Panda::Common;
use Panda::Builder;

%*ENV{'LD_LIBRARY_PATH'} = join("/", $*CWD, "blib/lib");

my $o = '.o';
my $so = '.so';
my $name = "libauthpamsimple";
my $libs = "-lpam";

class Build is Panda::Builder {
    method build($workdir) {
        say 'Building...';
        my $c_line = "$*VM<config><cc> -c -fPIC -o$workdir/src/$name$o "
        ~ " $workdir/src/$name.c";
        my $l_line = "$*VM<config><ld> -shared -s "
        ~ "$libs -o$workdir/src/$name$so $workdir/src/$name$o";
        say $c_line;
        say $l_line;
        shell($c_line);
        shell($l_line);
        shell("rm $workdir/src/$name$o");
        shell("mkdir -p $workdir/blib/lib/Auth/PAM");
        shell("cp $workdir/src/$name$so $workdir/blib/lib/Auth/PAM");
    }
}
