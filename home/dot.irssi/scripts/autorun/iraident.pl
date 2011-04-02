#!/usr/bin/perl

# This is for NickServ Russian Ircnet services
# just edit $ident_name and $password
# 
# tested on irc.nov.ru
# todo:
# - before quote codepage will be great to check current
# - notify from nickserv may has a different text


use strict;
use Irssi;

use vars qw($VERSION %IRSSI);                                                                                 

# config
eval 
{
	require Config::Simple;
	Config::Simple -> import();
	my $config = "./iraident.ini";
	my $cnf = new Config::Simple();
	$cnf -> read($config);
	my %cfg = $cnf -> vars();
	our $ident_name = $cfg{'identification.login'};
	our $password = $cfg{'identification.password'};
}
or do 
{
	our $ident_name = 'mr_X';
	our $password = 'fjfjf';
};


$VERSION = "0.6.1";                                                                                        
%IRSSI = (                                                                                                    
    authors     => "DonRumata",                                                                 
    contact     => "rumata\@dragons.ru",                                                                    
    name        => "iraident",                                                                                
    description => "IrcNet.ru Auto Identify - changes nick and send identify command, then sets codepage",                                                      
    license     => "GPLv2",                                                                                   
    url         => "http://rumata.dragons.ru",                                                                                        
    changed     => "$VERSION",                                                                                
    commands    => "none"                                                                                     
);


# my $ident_name = "me"; # we read this shti from config
# my $password   = ""; # we read this shti from config
my $fmt = "MSGLEVEL_CLIENTNOTICES";

sub server_event_catch {
    # $server = server record where the message came                                                      
    # $data = the raw data received from server, with PRIVMSGs it is:                                     
    #         "target :text" where target is either your nick or #channel                                 
    # $nick = the nick who sent the message                                                               
    # $host = host of the nick who sent the message
	our ($ident_name, $password);
    my ($server, $text, $nick, $user) = @_;

    if (($nick == 'NickServ') and ($user == 'service@RusNet')){
	# events:
	# Nick is registered or protected or not registered

	if ( $text =~ /nickname is owned/){ 
	    
	    if ($server->{'nick'} ne $ident_name){
		$server->command("NICK $ident_name");
		Irssi::print("ident string sent...",$fmt);
		return;
	    }

	    return if ($server->{'usermode'} =~ /(r)/);
	    $server->command("QUOTE NickServ identify $password");
	    Irssi::print("password sent",$fmt);

#	    $server->command("QUOTE codepage koi8");
#	    Irssi::print("codepage sent",$fmt);
	}
    }    
}

Irssi::signal_add('server event', 'server_event_catch');
