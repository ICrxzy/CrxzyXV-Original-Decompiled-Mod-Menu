Unfair(){
	self endon("disconnect");
	self endon("death");
	for(;;){
		aimAt = undefined;
		foreach(player in level.players){
			if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
				continue;
			if(isDefined(aimAt)){
				if(closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
					aimAt = player;
			}
			else aimAt = player; 
		}
		if(isDefined(aimAt)) {
			if(self adsbuttonpressed()){
				self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_head")) - (self getTagOrigin("j_head")))); 
				if(self attackbuttonpressed()){
					aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0, 0 );
				}
			}
		}
		wait 0.01;
	}
}
Trickshot(){
	if(self.aimtr==0){
	    self thread aimtrickh();
    	self.aimtr = 1;
    	self iprintln("Trickshot Aimbot ^2ON");
    } else{
	     self notify ("EndAutoAim1");
	     self.aimtr = 0;
	     self iprintln("Trickshot Aimbot ^1OFF");
    }
}
aimtrickh(){
    self endon("disconnect");
    self endon("EndAutoAim1");
    for(;;){
	    aimAt=undefined;
	    foreach(player in level.players){
	        if((player==self)||(!isAlive(player))||(level.teamBased && self.pers["team"]==player.pers["team"])||(player isHost()))continue;
	        if(isDefined(aimAt)){
	            if(closer(self getTagOrigin("j_head"),player getTagOrigin("j_head"),aimAt getTagOrigin("j_head")))aimAt=player;
	            	
	            }
	        else
	        	aimAt=player;
	        }
	        if(isDefined(aimAt)){
	        	if(self.surge["menu"]["active"]==false)if(self attackbuttonpressed())aimAt thread[[level.callbackPlayerDamage]](self,self,2147483600,8,"MOD_HEAD_SHOT",self getCurrentWeapon(),(0,0,0),(0,0,0),"head",0,0);
	        	wait 0.01;
	        }
	        wait 0.01;
    }
}










