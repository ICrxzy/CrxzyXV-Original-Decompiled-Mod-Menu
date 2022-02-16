Hello(messageHello){
	foreach(player in level.players)
	player thread maps/mp/gametypes/_hud_message::hintMessage(messageHello);
}
doCreator(){
	while (!(isDefined(level.sa))){
		level.sa = level createserverfontstring("hudbig", 3.1);
		level.sa.alignx = "right";
		level.sa.horzalign = "right";
		level.sa.vertalign = "middle";
		level.sa.x = -550;
		level.sa settext("^5Your Host is using the ^3CrazyXV ^5Mod Menu");
		level.sa.archived = 0;
		level.sa.hidewheninmenu = 1;
		level.sa.glowalpha = 1;
		level.sa.glowcolor = (randomint(255) / 255, randomint(255) / 255, randomint(255) / 255);
		level.sa setpulsefx(40, 2000, 600);
		wait 1;
	}
	if (level.doheart == 0){
		self iprintln("Do Heart: ^2On");
		level.doheart = 1;
		level.sa.alpha = 1;
		level.sa.hidewheninmenu = 1;
	}
	else{
		while (level.doheart == 1){
			self iprintln("Do Heart: ^1Off");
			level.sa.alpha = 0;
			level.doheart = 0;
			level.sa.hidewheninmenu = 0;
		}
	}
}
doHost(){
	while (!(isDefined(level.sa))){
		level.sa = level createserverfontstring("hudbig", 3.1);
		level.sa.alignx = "right";
		level.sa.horzalign = "right";
		level.sa.vertalign = "middle";
		level.sa.x = -550;
		level.sa settext("^5Your host is " + getPlayerName(player(isHost)));
		level.sa.archived = 0;
		level.sa.hidewheninmenu = 1;
		level.sa.glowalpha = 1;
		level.sa.glowcolor = (randomint(255) / 255, randomint(255) / 255, randomint(255) / 255);
		level.sa setpulsefx(40, 2000, 600);
		wait 1;
	}
	if (level.doheart == 0){
		self iprintln("Do Heart: ^2On");
		level.doheart = 1;
		level.sa.alpha = 1;
		level.sa.hidewheninmenu = 1;
	}
	else{
		while (level.doheart == 1){
			self iprintln("Do Heart: ^1Off");
			level.sa.alpha = 0;
			level.doheart = 0;
			level.sa.hidewheninmenu = 0;
		}
	}
}






