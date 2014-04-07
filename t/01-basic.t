use v6;
use Test;

use Auth::PAM::Simple;

ok True, "Module loaded";
is authenticate("login", "aaaa", "aaaa"), False, "Got false response for invalid user/pass";
