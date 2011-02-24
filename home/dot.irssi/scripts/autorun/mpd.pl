#!/usr/bin/perl
#
use strict;
use Irssi;
use vars qw($VERSION %IRSSI);
$VERSION = "0.00001";
%IRSSI = {
    authors     => 'Maxim Filimonov',
    contact     => '',
    name        => 'mpd',
    description => 'Control your mpd with irssi',
    license     => 'Public Domain',
    changed     => '2008-12-19 11:07'
};

Irssi::command_bind('np', \&np);
Irssi::command_bind('pnext', \&next);
Irssi::command_bind('pprev', \&prev);
Irssi::command_bind('ptoggle', \&ptoggle);
Irssi::command_bind('volup', \&volup);
Irssi::command_bind('voldn', \&voldn);
Irssi::command_bind('volume', \&volume); # this subr might become deprecated
Irssi::command_bind('rndtoggle', \&rndtoggle);
Irssi::command_bind('rpttoggle', \&rpttoggle);
Irssi::command_bind('vol', \&vol); # this subr is unstable
Irssi::command_bind('show', \&show);
Irssi::command_bind('alarm', \&alarm);

sub alarm {
	# schedule a wakeup
	# WARNING! NEEDS ATD RUNNING!
	# WARNING! NEEDS AN EVIL-FUCKIN SCRIPT /home/che/mpd! Maybe i should write it here?))
	# TODO :: out should look nicer
	my ($args, $server, $witem) = @_;
	my $time = "";
	my $out = "";
	if (!($args =~ "list"))
	{
		$time = $args;
		$out = `at $time < /home/che/mpd 2>&1`;
		Irssi::print("Scheduled wakeup \@ $time");
	}
	else
	{
		$out = `at -l 2>&1`;
		chomp($out);
		Irssi::print("Wakeups:\n" . $out);
	}
}

sub np {
	# echo the now playing
	# FIXME :: when not on channel/private, an error occurs! Should say that ur doin it wrong
	my ($args, $server, $witem) = @_;
	my $now = `mpc | head -1`;
	chomp($now);
	$witem->command("/me np :: " . $now);
}

sub next {
	# go to next track
	my ($args, $server, $witem) = @_;
	system("mpc next > /dev/null 2>&1");
	my $now = `mpc | head -1`;
	chomp($now);
	Irssi::print("Went to next track: " . $now);
}

sub prev {
	# go to previous track
	my ($args, $server, $witem) = @_;
	system("mpc prev > /dev/null 2>&1");
	my $now = `mpc | head -1`;
	chomp($now);
	Irssi::print("Went to previous track: " . $now);
}

sub ptoggle {
	# toggle play/pause
	my ($args, $server, $witem) = @_;
	system("mpc toggle > /dev/null 2>&1");
	my $now = `mpc | head -1`;
	chomp($now);
	Irssi::print("Toggled play/pause, playing " . $now);
}

sub volup {
	# volume +5
	my ($args, $server, $witem) = @_;
	my $vup = int($args);
	$vup = 5 unless($vup);
	system("mpc volume +" . $vup . " > /dev/null 2>&1");
	Irssi::print("Increased volume by " . $vup . " points");
}

sub voldn {
	# volume -5
	my ($args, $server, $witem) = @_;
	my $vup = int($args);
	$vup = 5 unless($vup);
	system("mpc volume -" . $vup . " > /dev/null 2>&1");
	Irssi::print("Decreased volume by " . $vup . " points");
}

sub volume {
	# set volume -- deprecated
	my ($args, $server, $witem) = @_;
	my $vol = $args;
#	$vol = int($vol);
	system("mpc volume " . $vol . " > /dev/null 2>&1");
	Irssi::print("Set volume to " . $vol);
}

sub rndtoggle {
	# toggle random on|off
	# maybe i should make it prettier?
	my ($args, $server, $witem) = @_;
	my $now = `mpc | grep random`;
	my $tog = "on";
	if ($now =~ /random\: on/)
	{
		$tog = "off";
	}
	else
	{
		$tog = "on";
	}
	system("mpc random " . $tog . " >/dev/null 2>&1");
	Irssi::print("Random is now " . $tog);
}

sub rpttoggle {
	# toggle repeat on|off
	my ($args, $server, $witem) = @_;
	my $now = `mpc | grep repeat`;
	my $tog = "on";
	if ($now =~ /repeat\: on/)
	{
		$tog = "off";
	}
	else
	{
		$tog = "on";
	}
	system("mpc repeat " . $tog . " >/dev/null 2>&1");
	Irssi::print("Repeat is now " . $tog);
}

sub vol {
	# set volume FIXME :: needs some testing 
	my ($args, $server, $witem) = @_;
	my $level = $args;
	($level) = split(" ", $level); # FIXME :: what to do with spaces
	$level =~ s/[a-z]|[\&,\*,\(,\),\',\",\[,\],\{,\},\,,\.,\/,\\,\|,\;,\:,\`]//gi; # FIXME :: regex
	my $out = `mpc volume $level | grep volume`;
	chomp($out);
#	$out =~ s/[repeat\: [on]|[off]]|[random\: [on]|[off]]//; # FIXME :: fix regex
	Irssi::print($out);
}

sub show {
	# echoes in the status window of what is playing now
	my ($args, $server, $witem) = @_;
	my $out = `mpc | head -1`;
	chomp($out);
	Irssi::print("Now playing: " . $out);
}

my $which_mpc = `which mpc`;
chomp($which_mpc);
if ($which_mpc . "A" eq "A")
{
	Irssi::print("mpc not found!");
}
