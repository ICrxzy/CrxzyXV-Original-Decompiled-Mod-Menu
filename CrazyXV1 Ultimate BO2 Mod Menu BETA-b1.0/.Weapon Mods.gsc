GiveMinigun(){
	self iprintln("^2 Minigun Given!");
	self giveweapon("minigun_mp");
	self switchtoweapon("minigun_mp");
}
swarmbullet(){
	self endon( "disconnect" );
	self endon( "stop_ok" );
	for(;;){
		self waittill( "weapon_fired" );
		forward = anglestoforward( self getplayerangles());
		start = self geteye();
		end = vector_scale( forward, 9999 );
		magicbullet( "missile_swarm_projectile_mp", start, bullettrace( start, start + end, 0, undefined )[ "position"], self );
	}
}
rapidfire(){
	self endon( "disconnect" );
	self.underfire = booleanopposite( self.underfire );
	self iprintln( booleanreturnval( self.underfire, "Rapid Fire ^1OFF", "Rapid Fire ^2ON" ) );
	if( self.underfire || self.rfire == 0 ){
		self.rfire = 1;
		setdvar( "perk_weapRateMultiplier", "0.001" );
		setdvar( "perk_weapReloadMultiplier", "0.001" );
		setdvar( "perk_fireproof", "0.001" );
		setdvar( "cg_weaponSimulateFireAnims", "0.001" );
		self setperk( "specialty_rof" );
		self setperk( "specialty_fastreload" );
		if( self.ammunition == 1 ){
			self.ammunition = 0;
		}
	}
	else{
		self.rfire = 0;
		setdvar( "perk_weapRateMultiplier", "1" );
		setdvar( "perk_weapReloadMultiplier", "1" );
		setdvar( "perk_fireproof", "1" );
		setdvar( "cg_weaponSimulateFireAnims", "1" );
		self unsetperk( "specialty_rof" );
		self unsetperk( "specialty_fastreload" );
	}
}
toggleswarmgun(){
	if( self.sg == 1 ){
		self thread swarmbullet();
		self iprintln("Swarm Gun ^2ON" );
		self.sg = 0;
	}
	else{
		self notify( "stop_ok" );
		self iprintln("Swarm Gun ^1OFF" );
		self.sg = 1;
	}
}
UnlockAllCamo(){
	self thread unlockallcamos(i);
	self thread camonlock();
	self thread maps\mp\gametypes\_hud_message::hintMessage("^2Weapons Camo Unlocked!!", 5);
}
unlockallcamos(i){
	self addweaponstat(i, "headshots", 5000 );
	self addweaponstat(i, "kills", 5000 );
	self addweaponstat(i, "direct_hit_kills", 100 );
	self addweaponstat(i, "revenge_kill", 2500 );
	self addweaponstat(i, "noAttKills", 2500 );
	self addweaponstat(i, "noPerkKills", 2500 );
	self addweaponstat(i, "multikill_2", 2500 );
	self addweaponstat(i, "killstreak_5", 2500 );
	self addweaponstat(i, "challenges", 5000 );
	self addweaponstat(i, "multikill_2", 2500 );
	self addweaponstat(i, "killstreak_5", 2500 );
	self addweaponstat(i, "challenges", 5000 );
	self addweaponstat(i, "longshot_kill", 750 );
	self addweaponstat(i, "direct_hit_kills", 120);
	self addweaponstat(i, "destroyed_aircraft_under20s", 120);
	self addweaponstat(i, "destroyed_5_aircraft", 120);
	self addweaponstat(i, "destroyed_aircraft", 120);
	self addweaponstat(i, "kills_from_cars", 120);
	self addweaponstat(i, "destroyed_2aircraft_quickly", 120);
	self addweaponstat(i, "destroyed_controlled_killstreak", 120);
	self addweaponstat(i, "destroyed_qrdrone", 120);
	self addweaponstat(i, "destroyed_aitank", 120);
	self addweaponstat(i, "multikill_3", 120);
	self addweaponstat(i, "score_from_blocked_damage", 140);
	self addweaponstat(i, "shield_melee_while_enemy_shooting", 140);
	self addweaponstat(i, "hatchet_kill_with_shield_equiped", 140);
	self addweaponstat(i, "noLethalKills", 140);
	self addweaponstat(i, "ballistic_knife_kill",5000);
	self addweaponstat(i, "kill_retrieved_blade", 160);
	self addweaponstat(i, "ballistic_knife_melee", 160);
	self addweaponstat(i, "kills_from_cars", 170);
	self addweaponstat(i, "crossbow_kill_clip", 170);
	self addweaponstat(i, "backstabber_kill", 190);
	self addweaponstat(i, "kill_enemy_with_their_weapon", 190);
	self addweaponstat(i, "kill_enemy_when_injured", 190);
	self addweaponstat(i, "primary_mastery",10000);
	self addweaponstat(i, "secondary_mastery",10000);
	self addweaponstat(i, "weapons_mastery",10000);
	self addweaponstat(i, "kill_enemy_one_bullet_shotgun", 5000);
	self addweaponstat(i, "kill_enemy_one_bullet_sniper", 5000);
}
camonlock(){
	self thread unlockallcamos("870mcs_mp");
	wait 2;
	self thread unlockallcamos("an94_mp");
	wait 2;
	self thread unlockallcamos("as50_mp");
	wait 2;
	self thread unlockallcamos("ballista_mp");
	wait 2;
	self thread unlockallcamos("beretta93r_dw_mp");
	wait 2;
	self thread unlockallcamos("beretta93r_lh_mp");
	wait 2;
	self thread unlockallcamos("beretta93r_mp");
	wait 2;
	self thread unlockallcamos("crossbow_mp");
	wait 2;
	self thread unlockallcamos("dsr50_mp");
	wait 2;
	self thread unlockallcamos("evoskorpion_mp");
	wait 2;
	self thread unlockallcamos("fiveseven_dw_mp");
	wait 2;
	self thread unlockallcamos("fiveseven_lh_mp");
	wait 2;
	self thread unlockallcamos("fiveseven_mp");
	wait 2;
	self thread unlockallcamos("fhj18_mp");
	wait 2;
	self thread unlockallcamos("fnp45_dw_mp");
	wait 2;
	self thread unlockallcamos("fnp45_lh_mp");
	wait 2;
	self thread unlockallcamos("fnp45_mp");
	wait 2;
	self thread unlockallcamos("hamr_mp");
	wait 2;
	self thread unlockallcamos("hk416_mp");
	wait 2;
	self thread unlockallcamos("insas_mp");
	wait 2;
	self thread unlockallcamos("judge_dw_mp");
	wait 2;
	self thread unlockallcamos("judge_lh_mp");
	wait 2;
	self thread unlockallcamos("judge_mp");
	wait 2;
	self thread unlockallcamos("kard_dw_mp");
	wait 2;
	self thread unlockallcamos("kard_lh_mp");
	wait 2;
	self thread unlockallcamos("kard_mp");
	wait 2;
	self thread unlockallcamos("kard_wager_mp");
	wait 2;
	self thread unlockallcamos("knife_ballistic_mp");
	wait 2;
	self thread unlockallcamos("knife_held_mp");
	wait 2;
	self thread unlockallcamos("knife_mp");
	wait 2;
	self thread unlockallcamos("ksg_mp");
	wait 2;
	self thread unlockallcamos("lsat_mp");
	wait 2;
	self thread unlockallcamos("mk48_mp");
	wait 2;
	self thread unlockallcamos("mp7_mp");
	wait 2;
	self thread unlockallcamos("pdw57_mp");
	wait 2;
	self thread unlockallcamos("peacekeeper_mp");
	wait 2;
	self thread unlockallcamos("qbb95_mp");
	wait 2;
	self thread unlockallcamos("qcw05_mp");
	wait 2;
	self thread unlockallcamos("riotshield_mp");
	wait 2;
	self thread unlockallcamos("sa58_mp");
	wait 2;
	self thread unlockallcamos("saiga12_mp");
	wait 2;
	self thread unlockallcamos("saritch_mp");
	wait 2;
	self thread unlockallcamos("scar_mp");
	wait 2;
	self thread unlockallcamos("sig556_mp");
	wait 2;
	self thread unlockallcamos("smaw_mp");
	wait 2;
	self thread unlockallcamos("srm1216_mp");
	wait 2;
	self thread unlockallcamos("svu_mp");
	wait 2;
	self thread unlockallcamos("tar21_mp");
	wait 2;
	self thread unlockallcamos("type95_mp");
	wait 2;
	self thread unlockallcamos("usrpg_mp");
	wait 2;
	self thread unlockallcamos("vector_mp");
	wait 2;
	self thread unlockallcamos("xm8_mp");
}
ToggleTeleportGun(){
	if (self.TPG == true){
		self thread TeleportGun();
		self iPrintln("Teleport Gun ^2ON");
		self.TPG = false;
	}
	else{
		self notify("Stop_TP");
		self iprintln("Teleport Gun ^1OFF");
		self.TPG = true;
	}
}
TeleportGun(){
	self endon( "disconnect" );
	self endon( "Stop_TP" );
	for(;;){
		self waittill( "weapon_fired" );
		self setorigin( bullettrace( self gettagorigin( "j_head" ), self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 1000000, 0, self )[ "position"] );
	}
}
ClassChg(){
	self endon("disconnect");
	self endon("death");
	self maps/mp/gametypes/_globallogic_ui::beginclasschoice();
	for(;;){
		if(self.pers[ "changed_class" ])
		self maps/mp/gametypes/_class::giveloadout( self.team, self.class );
		wait 0.05;
	}
}
initrpgbullet(){
	if( self.rpgtog == 0 ){
		self iprintln( "RPG Bullets ^2ON" );
		self thread rpgbullet();
		self.rpgtog = 1;
	}
	else
{
		self iprintln( "RPG Bullets ^1OFF" );
		self notify( "stopRPG" );
		self.rpgtog = 0;
	}
}
rpgbullet(){
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "stopRPG" );
	for(;;){
		self waittill( "weapon_fired" );
		forward = anglestoforward( self getplayerangles() );
		start = self geteye();
		end = vector_scale( forward, 9999 );
		magicbullet( "usrpg_mp", start, bullettrace( start, start + end, 0, undefined )[ "position"], self );
	}
}
docaremaker2(){
	if( self.caremaker2 == 0 ){
		self thread caremaker();
		self.caremaker2 = 1;
		self iprintln("Care Package Gun ^2ON");
	}
	else{
		if( self.caremaker2 == 1 ){
			self.caremaker2 = 0;
			self notify( "CareMaker2_end" );
			self iprintln( "Care Package Gun ^1OFF" );
		}
	}
}
caremaker(){
	self endon( "disconnect" );
	self endon( "CareMaker2_end" );
	self iprintln( "Care Package Gun!, Shoot To Spawn Care Packages" );
	for(;;){
		self waittill( "weapon_fired" );
		start = self gettagorigin( "tag_eye" );
		end *= 1000000;
		destination = bullettrace( start, end, 1, self )[ "position"];
		self thread dropcrate( destination, self.angles, "supplydrop_mp", self, self.team, self.killcament, undefined, undefined, undefined );
		wait 1;
	}

}





