ForceHost(){
    if(self.fhost == false){
        self.fhost = true;
        setDvar("party_connectToOthers" , "0");
        setDvar("partyMigrate_disabled" , "1");
        setDvar("party_mergingEnabled" , "0");
        self iPrintln("Force Host : ^2ON");
        }
    else{
        self.fhost = false;
        setDvar("party_connectToOthers" , "1");
        setDvar("partyMigrate_disabled" , "0");
        setDvar("party_mergingEnabled" , "1");
        self iPrintln("Force Host : ^1OFF");
    }
}
dorestart(){
	map_restart( 0 );
}
toggleantiquit(){
	if( level.doantiquit == 0 ){
		foreach( player in level.players ){
			player thread doantiquit();
		}
		level.doantiquit = 1;
		self iprintln( "Anti Quit : ^2ON" );
	}
	else{
		foreach( player in level.players ){
			player notify( "EnddoAntiQuit" );
		}
		level.doantiquit = 0;
		self iprintln( "Anti Quit : ^1OFF" );
	}
}
doantiquit(){
	self endon( "disconnect" );
	self endon( "EnddoAntiQuit" );
	for(;;){
		self closemenus();
		wait 0.05;
	}
}
endgame(){
	self freezecontrols( 0 );
	self iprintln( "^2HOST ENDED GAME" );
	level thread forceend();
}




