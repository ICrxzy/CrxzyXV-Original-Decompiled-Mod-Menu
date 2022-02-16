freezeall(){
	while( level.frozen == 0 ){
		self iprintln( "EVERYONE HAS BEEN FROZEN" );
		level.frozen = 1;
		while( 1 ){
			while( level.frozen ){
				foreach( player in level.players ){
					if( !(player ishost()) ){
						player freezecontrols( 1 );
					}
				}
			}
			foreach( player in level.players ){
				player freezecontrols( 0 );
			}
			break;
			wait 0.5;
		}
	}
	self iprintln( "^1EVERYONE IS NO LONGER FROZEN" );
	level.frozen = 0;
	foreach( player in level.players ){
		player freezecontrols( 0 );
	}
}

godmodeall(){
	while( level.godmodeall == 0 ){
		level.godmodeall = 1;
		self iprintln( "^2GODMODE GIVEN" );
		while( 1 ){
			while( level.godmodeall ){
				foreach( player in level.players ){
					player enableinvulnerability();
				}
			}
			break;
			wait 0.05;
		}
	}
	level.godmodeall = 0;
	self iprintln( "^1GODMODE TAKEN" );
	foreach( player in level.players ){
		player disableinvulnerability();
	}
}
infiniteammoall(){
	while( level.ammoall == 0 ){
		level.ammoall = 1;
		self iprintln( "^2INFINITE AMMO GIVEN" );
		while( 1 ){
			while( level.ammoall ){
				foreach( player in level.players ){
					currentweapon = player getcurrentweapon();
					if( currentweapon != "none" ){
						player setweaponammoclip( currentweapon, weaponclipsize( currentweapon ) );
						player givemaxammo( currentweapon );
					}
					currentoffhand = player getcurrentoffhand();
					if( currentoffhand != "none" ){
						player givemaxammo( currentoffhand );
					}
				}
			}
			break;
			wait 0.05;
		}
	}
	level.ammoall = 0;
	self iprintln( "^1INFINITE AMMO TAKEN" );
}
giveallminigun(){
	foreach( player in level.players ){
		player giveweapon( "minigun_mp" );
		player switchtoweapon( "minigun_mp" );
		player givemaxammo( "minigun_mp" );
		player iprintln( "^2Miniguns Given" );
	}
}
hearallplayers(){
	if( self.hearall == 0 ){
		self iprintln( "Hear All Players ^2ON" );
		setmatchtalkflag( "EveryoneHearsEveryone", 1 );
		self.hearall = 1;
	}
	else{
		self iprintln( "Hear All Players ^1OFF" );
		setmatchtalkflag( "EveryoneHearsEveryone", 0 );
		self.hearall = 0;
	}
}
allplayerskilled(){
	foreach( player in level.players ){
		if( player ishost() ){
		
		}
		else
		{
			player suicide();
		}
	}
	self iprintln( "All Players ^2Killed !" );
}
kickall(){
	foreach( player in level.players ){
		if( player ishost() ){
		
		}
		else{
			kick( player );
		}
	}
	self iprintln( "All Players ^2Kicked!" );
}


