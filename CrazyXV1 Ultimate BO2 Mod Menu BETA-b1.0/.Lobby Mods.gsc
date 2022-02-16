hardcore(){
	if( getdvar( "scr_hardcore" ) == "0" ){
		self iprintln( "Hardcore ^2ON" );
		setdvar( "scr_hardcore", "1" );
		wait 2;
		self thread dorestart();
	}
	else{
		if( getdvar( "scr_hardcore" ) == "1" ){
			self iprintln( "^2Hardcore ^1OFF" );
			setdvar( "scr_hardcore", "0" );
			wait 2;
			self thread dorestart();
		}
	}
}
DelBot(){
	if(self isHost()){
		self thread DeleteBots();
		self iprintln("^2All Bots Deleted");
	}
}
DeleteBots(){
	foreach(player in level.players){
		if(isBot(player)){
			kick(player getEntityNumber());
		}
	}
}
isBot(player){
	isBot = player.pers["isBot"];
	return isDefined(isBot) && isBot;
}
Spawn1Bot(){
    if(self isHost()){
        self thread Spawn1BotsGo();
        self iprintln("^2Spawned 1 Bot");
    }
}

Spawn1BotGo(autoassign){
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
}
Spawn3Bots(){
    if(self isHost()){
        self thread Spawn3BotsGo();
        self iprintln("^2Spawned 3 Bots");
    }
}

Spawn3BotsGo(autoassign){
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
}
SpawnMaxBots(){
    if(self isHost()){
        self thread SpawnMaxBotsGo();
        self iprintln("^2Spawned Max Bots");
    }
}

SpawnMaxBotsGo(autoassign){
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
    maps/mp/bots/_bot::spawn_bot(autoassign);
    wait 0.3;
}
dosky(){
	if( self.skycolor == 0 ){
		self iprintln( "^2Sky - 1" );
		setdvar( "r_skyColorTemp", "1234" );
		self.skycolor = 1;
	}
	else{
		if( self.skycolor == 1 ){
			self iprintln( "^2Sky - 2" );
			self.skycolor = 2;
			setdvar( "r_skyColorTemp", "2345" );
		}
		else{
			if( self.skycolor == 2 ){
				self iprintln( "^2Sky - 3" );
				self.skycolor = 3;
				setdvar( "r_skyColorTemp", "3456" );
			}
			else{
				if( self.skycolor == 3 ){
					self iprintln( "^2Sky - 4" );
					self.skycolor = 4;
					setdvar( "r_skyColorTemp", "4567" );
				}
				else{
					if( self.skycolor == 4 ){
						self iprintln( "^2Sky - 5" );
						self.skycolor = 0;
						setdvar( "r_skyColorTemp", "5678" );
					}
				}
			}
		}
	}
}





