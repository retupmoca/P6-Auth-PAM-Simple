unit module Auth::PAM::Simple;

our sub authenticate($service, Str $user, Str $pass --> Bool) is export {
    return !auth($service, $user, $pass);
}

use NativeCall;
use LibraryMake;
use Find::Bundled;

sub library {
    my $so = get-vars('')<SO>;
    return Find::Bundled.find("libauthpamsimple$so", "Auth/PAM", :throw); 
}

sub auth(Str is encoded('ascii'), Str is encoded('ascii'), Str is encoded('ascii')) is native(&library) returns int32 { * };
