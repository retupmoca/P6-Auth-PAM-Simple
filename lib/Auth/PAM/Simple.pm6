module Auth::PAM::Simple;

our sub authenticate(Str $service, Str $user, Str $pass --> Bool) is export {
    return !auth($service, $user, $pass);
}

use NativeCall;

sub auth(Str is encoded('ascii'), Str is encoded('ascii'), Str is encoded('ascii')) returns int32 is native($*VM<config><prefix>~'/languages/perl6/site/lib/Auth/PAM/libauthpamsimple.so') { * }
