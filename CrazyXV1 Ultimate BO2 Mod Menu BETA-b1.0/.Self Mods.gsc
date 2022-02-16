GodMode(){
	if(self.gmode == 1){
		self iPrintln("God mode ^2ON");
		self enableInvulnerability();
		self.gmode = 2;
	}
	else if(self.gmode == 2){
		self iPrintln("God mode ^1OFF");
		self disableInvulnerability();
		self.gmode = 1;
	}
}
dovisions(){
	if( self.retard == 0 ){
		self useservervisionset( 0 );
		self setinfraredvision( 0 );
		wait 0.01;
		self iprintln( "Black and White" );
		self useservervisionset( 1 );
		self setvisionsetforplayer( "mpintro", 0 );
		self.retard = 1;
	}
	else{
		if( self.retard == 1 ){
			self useservervisionset( 0 );
			self setinfraredvision( 0 );
			wait 0.01;
			self iprintln( "^0Light Vision" );
			self.retard = 2;
			self useservervisionset( 1 );
			self setvisionsetforplayer( "taser_mine_shock", 0 );
		}
		else{
			if( self.retard == 2 ){
				self useservervisionset( 0 );
				self setinfraredvision( 0 );
				wait 0.01;
				self iprintln( "^2Enhanced Vision" );
				self.retard = 3;
				self useservervisionset( 1 );
				self setvisionsetforplayer( "remote_mortar_enhanced", 0 );
			}
			else{
				if( self.retard == 3 ){
					self useservervisionset( 0 );
					self setinfraredvision( 0 );
					wait 0.01;
					self setinfraredvision( 1 );
					self iprintln( "^1Thermal Vision" );
					self.retard = 4;
				}
				else{
					if( self.retard == 4 ){
						self useservervisionset( 1 );
						self setvisionsetforplayer( "remote_mortar_enhanced", 0 );
						self iprintln( "^4Cartoon Vision" );
						self.retard = 5;
					}
					else{
						if( self.retard == 5 ){
							self useservervisionset( 0 );
							self setinfraredvision( 0 );
							self iprintln( "^3Normal Vision" );
							self.retard = 0;
						}
					}
				}
			}
		}
	}
}
cloneyourself(){
	self iprintln( "Clone ^2Given" );
	self cloneplayer( 1 );
}
thirdperson(){
	if( self.tpp == 1 ){
		self setclientthirdperson( 1 );
		self iprintln( "Third Person: ^2ON" );
		self.tpp = 0;
	}
	else{
		self setclientthirdperson( 0 );
		self iprintln( "Third Person: ^1OFF" );
		self.tpp = 1;
	}
}

toggleleft(){
	if( self.lg == 1 ){
		self iprintln( "Left Handed ^2ON" );
		setdvar( "cg_gun_y", "7" );
		self.lg = 0;
	}
	else{
		self iprintln( "Left Handed ^1OFF" );
		setdvar( "cg_gun_y", "0" );
		self.lg = 1;
	}
}
kys(){
	self suicide();
}
TogglenNoclip(){
	if (self.noclip == 0){
		self.noclip = 1;
		self iprintln("NoClip ^2Enabled");
		self iprintln("Press [{+frag}] to ^5Fly ^7! ");
		self thread noclip();
	}
	else{
		self.noclip = 0;
		self iprintln("NoClip ^1Disabled");
		self notify("stop_noclip");
		self unlink();
		self enableweapons();
		self.originobj delete();
	}
}

noclip(){
	self endon("stop_noclip");
	self.originobj = spawn("script_origin", self.origin, 1);
	self.originobj.angles = self.angles;
	self playerlinkto(self.originobj, undefined);
	self disableweapons();
	if (self fragbuttonpressed()){
		normalized = anglesToForward(self getplayerangles());
		scaled = vectorScale(normalized, 20);
		originpos = self.origin + scaled;
	}
	else{
		self.originobj.origin = originpos;
	}
	wait 0.05;
}
Invisible(){
	if (self.inv == 0){
		self.inv = 1;
		self iprintln("You are ^2Invisible");
		self hide();
	}
	else{
		self.inv = 0;
		self iprintln("You are ^1Visible");
		self show();
	}
}
InifiniteAmmo(){
    self endon("disconnect");
    self endon("death");
	for(;;){
        wait 0.1;
        currentWeapon = self getcurrentweapon();
        if ( currentWeapon != "none"){
            self setweaponammoclip(currentWeapon, weaponclipsize(currentWeapon));
            self givemaxammo(currentWeapon);
        }
		currentoffhand = self getcurrentoffhand();
		if(currentoffhand != "none")
		self givemaxammo(currentoffhand);
	}
}
toggleFOV1(){
	if(self.fov == 1){
		self setClientFov(80);
		self iPrintln("^2Field of view set to ^280");
		self.fov = 2;
	}
	else if(self.fov == 2){
		self setClientFov(90);
		self iPrintln("^2Field of view set to ^290");
		self.fov = 3;
	}
	else if(self.fov == 3){
		self setClientFov(100);
		self iPrintln("^2Field of view set to ^2100");
		self.fov = 4;
	}
	else if(self.fov == 4){
		self setClientFov(110);
		self iPrintln("^2Field of view set to ^2110");
		self.fov = 5;
	}
	else if(self.fov == 5){
		self setClientFov(120);
		self iPrintln("^2Field of view set to ^2120");
		self.fov = 6;
	}
	else if(self.fov == 6){
		self setClientFov(65);
		self iPrintln("^2Field of view set to ^165");
		self.fov = 1;
	}
}
AutoDropshot(){
	if(self.Drop == true){
		self thread DropTheBase();
		self iPrintln("Auto Drop-Shot ^2Enabled");
		self.Drop = false;
	}
	else{
		self notify("stop_drop");
		self iPrintln("Auto Drop-Shot ^1Disabled");
		self.Drop = true;
	}
}
DropTheBase(){
	self endon("disconnect");
	self endon("stop_drop");
	for(;;)
	{
		self waittill ("weapon_fired");
		self setStance("prone");
	}
}
GivePerks(){
    self clearPerks();
    self setPerk("specialty_additionalprimaryweapon");
    self setPerk("specialty_armorpiercing");
    self setPerk("specialty_armorvest");
    self setPerk("specialty_bulletaccuracy");
    self setPerk("specialty_bulletdamage");
    self setPerk("specialty_bulletflinch");
    self setPerk("specialty_bulletpenetration");
    self setPerk("specialty_deadshot");
    self setPerk("specialty_delayexplosive");
    self setPerk("specialty_detectexplosive");
    self setPerk("specialty_disarmexplosive");
    self setPerk("specialty_earnmoremomentum");
    self setPerk("specialty_explosivedamage");
    self setPerk("specialty_extraammo");
    self setPerk("specialty_fallheight");
    self setPerk("specialty_fastads");
    self setPerk("specialty_fastequipmentuse");
    self setPerk("specialty_fastladderclimb");
    self setPerk("specialty_fastmantle");
    self setPerk("specialty_fastmeleerecovery");
    self setPerk("specialty_fastreload");
    self setPerk("specialty_fasttoss");
    self setPerk("specialty_fastweaponswitch");
    self setPerk("specialty_finalstand");
    self setPerk("specialty_fireproof");
    self setPerk("specialty_flakjacket");
    self setPerk("specialty_flashprotection");
    self setPerk("specialty_gpsjammer");
    self setPerk("specialty_grenadepulldeath");
    self setPerk("specialty_healthregen");
    self setPerk("specialty_holdbreath");
    self setPerk("specialty_immunecounteruav");
    self setPerk("specialty_immuneemp");
    self setPerk("specialty_immunemms");
    self setPerk("specialty_immunenvthermal");
    self setPerk("specialty_immunerangefinder");
    self setPerk("specialty_killstreak");
    self setPerk("specialty_longersprint");
    self setPerk("specialty_loudenemies");
    self setPerk("specialty_marksman");
    self setPerk("specialty_movefaster");
    self setPerk("specialty_nomotionsensor");
    self setPerk("specialty_noname");
    self setPerk("specialty_nottargetedbyairsupport");
    self setPerk("specialty_nokillstreakreticle");
    self setPerk("specialty_nottargettedbysentry");
    self setPerk("specialty_pin_back");
    self setPerk("specialty_pistoldeath");
    self setPerk("specialty_proximityprotection");
    self setPerk("specialty_quickrevive");
    self setPerk("specialty_quieter");
    self setPerk("specialty_reconnaissance");
    self setPerk("specialty_rof");
    self setPerk("specialty_scavenger");
    self setPerk("specialty_showenemyequipment");
    self setPerk("specialty_stunprotection");
    self setPerk("specialty_shellshock");
    self setPerk("specialty_sprintrecovery");
    self setPerk("specialty_showonradar");
    self setPerk("specialty_stalker");
    self setPerk("specialty_twogrenades");
    self setPerk("specialty_twoprimaries");
    self setPerk("specialty_unlimitedsprint");
    self iPrintln("All Perks ^2SET");
}
SaveLoad(){
	if(self.snl == 0){
		self iprintln("Save and Load ^2ON");
		self iprintln("Press [{actionslot 3}] to Save");
		self iprintln("Press [{actionslot 4]} to Load");
		self thread dosaveandload();
		self.snl = 1;
	}
	else{
	  	self iprintln("Save and Load ^1OFF");
	  	self.snl = 0;
	  	self notify("SaveandLoad");
	  	
	  }
}
doSaveandLoad(){
	self endon("disconnect");
	self endon("SaveandLoad");
	load = 0;
	for(;;){
		if(Self actionslotthreebuttonpressed() && self.snl == 1){
			self.o = self.origin;
			self.a = self.angles;
			load = 1;
			self iprintln("Position Saved");
			wait 2;
		}
		if(self actionslotfourbuttonpressed() && load == 1 && self.snl == 1){
			self setplayerangles(self.a);
			self setorigin(self.o);
			self iprintln("Position ^2Loaded");
			wait 2;
		}
		wait 0.5;
	}
}
toggleuav(){
	if( self.uav == 1 ){
		self iprintln( "UAV ^2ON" );
		self setclientuivisibilityflag( "g_compassShowEnemies", 1 );
		self.uav = 0;
	}
	else{
		self iprintln( "UAV ^1OFF" );
		self setclientuivisibilityflag( "g_compassShowEnemies", 0 );
		self.uav = 1;
	}
}
flashfeed2(){
	if( self.flashfeed2 == 0 ){
		self thread flashfeed();
		self.flashfeed2 = 1;
		self iprintln( "Flash Feed ^2ON" );
	}
	else{
		self notify( "FlashFeed2_end" );
		self.flashfeed2 = 0;
		self iprintln( "Flash Feed ^1OFF^7" );
	}
}

flashfeed(){
	self endon( "disconnect" );
	self endon( "FlashFeed2_end" );
	for(;;){
		setdvar( "g_TeamColor_Axis", "1 0 0 1" );
		setdvar( "g_TeamColor_Allies", "1 0 0 1" );
		wait 0.2;
		setdvar( "g_TeamColor_Axis", "1 0.7 0 1" );
		setdvar( "g_TeamColor_Allies", "1 0.7 0 1" );
		wait 0.2;
		setdvar( "g_TeamColor_Axis", "1 1 0 1" );
		setdvar( "g_TeamColor_Allies", "1 1 0 1" );
		wait 0.2;
		setdvar( "g_TeamColor_Axis", "0 1 0 1" );
		setdvar( "g_TeamColor_Allies", "0 1 0 1" );
		wait 0.2;
		setdvar( "g_TeamColor_Axis", "0 0 1 1" );
		setdvar( "g_TeamColor_Allies", "0 0 1 1" );
		wait 0.2;
		setdvar( "g_TeamColor_Axis", "1 0 1 1" );
		setdvar( "g_TeamColor_Allies", "1 0 1 1" );
		wait 0.2;
		setdvar( "g_TeamColor_Axis", "0 1 1 1" );
		setdvar( "g_TeamColor_Allies", "0 1 1 1" );
		wait 0.1;
	}
}





