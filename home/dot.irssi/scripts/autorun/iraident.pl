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


my $fnode_name = "freenode-nick";
my $rusnet_name = "rusnet-nick";
my $ident_name = ''; # DIRTY
my $rusnet_passwd   = "freenode-passwd";
my $fnode_passwd = "rusnet-passwd";
my $password = ''; # DIRTY
my $fmt = "MSGLEVEL_CLIENTNOTICES";

sub server_event_catch {
    # $server = server record where the message came                                                      
    # $data = the raw data received from server, with PRIVMSGs it is:                                     
    #         "target :text" where target is either your nick or #channel                                 
    # $nick = the nick who sent the message                                                               
    # $host = host of the nick who sent the message

    my ($server, $text, $nick, $user) = @_;

    if (($nick eq 'NickServ') and (($user eq 'service@RusNet') or ($user eq 'NickServ@services.'))) {
	# events:
	# Nick is registered or protected or not registered
	
		if ($user eq 'service@RusNet') { # rusnet
			($ident_name, $password) = ($rusnet_name, $rusnet_passwd);
		}
		elsif ($user eq 'NickServ@services.') { # freenode
			($ident_name, $password) = ($fnode_name, $fnode_passwd);
		}
		else { # something unknown
			($ident_name, $password) = ("unknown_server", "change the script");
		}
		if ( $text =~ /lease choose/) { 
			
			if ($server->{'nick'} ne $ident_name) {
				$server->command("NICK $ident_name");
				Irssi::print("ident string sent...",$fmt);
#				return;
			}

			return if ($server->{'usermode'} =~ /(r)/);
			
			$server->command("QUOTE NickServ identify $password");
			Irssi::print("password sent to $user",$fmt);

#	    $server->command("QUOTE codepage koi8");
#	    Irssi::print("codepage sent",$fmt);
		}
    }    
}

Irssi::signal_add('server event', 'server_event_catch');
