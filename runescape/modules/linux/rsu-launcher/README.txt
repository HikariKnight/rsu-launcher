The rsu-launcher relies on wxwidgets2.9 which is still not released!
The easiest way to use the launcher is to package it in citrus perl
which comes with wxwidgets2.9.

You can do this by downloading citrus perl from http://www.citrusperl.com/
then run the relocate script for citrusperl.
Run cpan from citrus perl and type in

install PAR::Packer
install Wx::Perl::Packager

this will install pp and wxpar.
now go to this directory and run (replace $citrusperldir with the location of citrus perl)

for 64bit:
$citrusperldir/site/bin/wxpar -gui -o rsu-launcher-x86_64 rsu-launcher

for 32bit:
$citrusperldir/site/bin/wxpar -gui -o rsu-launcher-i386 rsu-launcher

this will package the rsu-launcher with wxwidgets2.9 however
IF you get more than 3 warnings about missing .so files when packaging
you will have to go to the location told by wxpar and manually symlink
the .so files correctly and re run wxpar.