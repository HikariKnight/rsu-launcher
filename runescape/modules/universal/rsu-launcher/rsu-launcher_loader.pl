#!/usr/bin/perl -w

# Use FindBin module to get script directory
use FindBin;

# Load the required Wx modules
use Wx::Perl::Packager;
use Wx qw[:everything];
use Wx::XRC;
use Wx::WebView;

# Use LWP::Simple module to get website content (crossplatform)
use LWP::Simple;

# Include the byte encryption so that the script will work on all localizations of windows or other systems
# Odd i know, but it is caused by the windows codepages (like chcp 1252 which is scandinavian)
use Encode::Byte;

# Include the module for extracting archives
use Archive::Extract;

# If we are on windows
if ("$^O" =~ /MSWin32/)
{
	# Make sure some windows modules gets included
	eval "use Win32::API";
	eval "use File::DosGlob";
	eval "use Tie::Scalar";
	
	# Hide the commandline windows
	eval "use Win32::GUI()";
	
	# If the arguments passed do not contain --showcmd=true
	if ("@ARGV" !~ /(-|--)showcmd=true/)
	{
		# Get the handle for the perl window
		my $loader_cmdwindow = Win32::GUI::GetPerlWindow();
		# Hide the cmd window
		Win32::GUI::Hide($loader_cmdwindow);
	}
	# Else
	else
	{
		# Remove --showcmd=true or -showcmd=true from the arguments array
		s/(-|--)showcmd=true(\s)//g for @ARGV;
	}
}

# If a script is passed to this binary
if ("@ARGV" =~ /(-|--)script=/)
{
	# Make a variable to contain the script we are going to run
	my $loader_script;
	
	# Loop through each argument
	foreach my $loader_arg (@ARGV)
	{
		# If the current argument is the script
		if ($loader_arg =~ /(-|--)script=/i)
		{
			# Remove --script= or -script= from the string
			$loader_arg =~ s/(-|--)script=//i;
			
			# Put the script location into the script variable
			$loader_script = $loader_arg;
			
			# Remove the --script=$arg or -script=$arg from the arguments array
			s/(-|--)script=\Q$loader_arg\E//i for @ARGV;
			
			# Fetch out the name of the script from the path
			my @loader_scriptname = split /(\\|\/)/, $loader_arg;
			
			# Remove the scriptname and the last \ or / from the path
			$loader_arg =~ s/(\\|\/)$loader_scriptname[-1]$//;
			
			# Append a new parameter to the arguments which specifies
			# That this was loaded through a loader and also provide
			# What would actually been the scriptpath if we did not use the loader
			push(@ARGV, "--scriptpath=$loader_arg");
		}
	}
	
	# Load the specified script
	require "$FindBin::RealBin/$loader_script";
}
# Else
else
{
	# If we are on windows
	if ("$^O" =~ /MSWin32/)
	{
		# Load the runescape script inside this loader 
		#(if this loader is packaged with PAR::Packer this 
		# will let the perl script run inside the compressed perl)
		require "$FindBin::RealBin/modules/universal/rsu-launcher/rsu-launcher";
	}
	else
	{
		# Load the runescape script inside this loader 
		#(if this loader is packaged with PAR::Packer this 
		# will let the perl script run inside the compressed perl)
		require "$FindBin::RealBin/rsu-launcher";
	}
}

# Exit the script when done
exit;
