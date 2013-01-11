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

cd to the location of the wxWidgets2.9 libraries and run these commands
if wxpar complains about not finding the libraries
(normally it should only complain about 3 non existing libraries)

ln -s libwx_gtk2u_ribbon-2.9.so libwx_gtk2u_ribbon-2.9.so.0
ln -s libwx_gtk2u_adv-2.9.so libwx_gtk2u_adv-2.9.so.0
ln -s libwx_gtk2u_webview-2.9.so libwx_gtk2u_webview-2.9.so.0
ln -s libwx_gtk2u_propgrid-2.9.so libwx_gtk2u_propgrid-2.9.so.0
ln -s libwx_gtk2u_qa-2.9.so libwx_gtk2u_qa-2.9.so.0
ln -s libwx_gtk2u_stc-2.9.so libwx_gtk2u_stc-2.9.so.0
ln -s libwx_gtk2u_fl-2.9.so libwx_gtk2u_fl-2.9.so.0
ln -s libwx_gtk2u_aui-2.9.so libwx_gtk2u_aui-2.9.so.0
ln -s libwx_baseu-2.9.so libwx_baseu-2.9.so.0
ln -s libwx_gtk2u_xrc-2.9.so libwx_gtk2u_xrc-2.9.so.0
ln -s libwx_gtk2u_animate-2.9.so libwx_gtk2u_animate-2.9.so.0
ln -s libwx_baseu_xml-2.9.so libwx_baseu_xml-2.9.so.0
ln -s libwx_gtk2u_media-2.9.so libwx_gtk2u_media-2.9.so.0
ln -s libwx_gtk2u_html-2.9.so libwx_gtk2u_html-2.9.so.0
ln -s libwx_baseu_net-2.9.so libwx_baseu_net-2.9.so.0
ln -s libwx_gtk2u_gl-2.9.so libwx_gtk2u_gl-2.9.so.0
ln -s libwx_gtk2u_richtext-2.9.so libwx_gtk2u_richtext-2.9.so.0
ln -s libwx_gtk2u_core-2.9.so libwx_gtk2u_core-2.9.so.0
