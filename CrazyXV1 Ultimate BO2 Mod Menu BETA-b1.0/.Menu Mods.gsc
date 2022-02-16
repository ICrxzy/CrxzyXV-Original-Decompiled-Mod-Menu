RedMenu(){
	self.menu.scroller FadeOverTime(0.3);
	self.menu.scroller.color = (1, 0, 0);
	self.menu.background FadeOverTime(0.3);
	self.menu.background.color = (1, 0, 0);
	self.menu.SideLine1 FadeOverTime(0.3);
	self.menu.SideLine1.color = (1, 0, 0);
	self.menu.SideLine2 FadeOverTime(0.3);
	self.menu.SideLine2.color = (1, 0, 0);
}
BlackMenu(){
	self.menu.scroller FadeOverTime(0.3);
	self.menu.scroller.color = (0, 0, 0);
	self.menu.background FadeOverTime(0.3);
	self.menu.background.color = (0, 0, 0);
	self.menu.SideLine1 FadeOverTime(0.3);
	self.menu.SideLine1.color = (0, 0, 0);
	self.menu.SideLine2 FadeOverTime(0.3);
	self.menu.SideLine2.color = (0, 0, 0);
}
BlueMenu(){
	self.menu.scroller FadeOverTime(0.3);
	self.menu.scroller.color = (0, 0, 1);
	self.menu.background FadeOverTime(0.3);
	self.menu.background.color = (0, 0, 1);
	self.menu.SideLine1 FadeOverTime(0.3);
	self.menu.SideLine1.color = (0, 0, 1);
	self.menu.SideLine2 FadeOverTime(0.3);
	self.menu.SideLine2.color = (0, 0, 1);
}
GreenMenu(){
	self.menu.scroller FadeOverTime(0.3);
	self.menu.scroller.color = (0, 1, 0);
	self.menu.background FadeOverTime(0.3);
	self.menu.background.color = (0, 1, 0);
	self.menu.SideLine1 FadeOverTime(0.3);
	self.menu.SideLine1.color = (0, 1, 0);
	self.menu.SideLine2 FadeOverTime(0.3);
	self.menu.SideLine2.color = (0, 1, 0);
}
WiteMenu(){
	self.menu.scroller FadeOverTime(0.3);
	self.menu.scroller.color = (1, 1, 1);
	self.menu.background FadeOverTime(0.3);
	self.menu.background.color = (1, 1, 1);
	self.menu.SideLine1 FadeOverTime(0.3);
	self.menu.SideLine1.color = (1, 1, 1);
	self.menu.SideLine2 FadeOverTime(0.3);
	self.menu.SideLine2.color = (1, 1, 1);
}
RainbowShaders(){
	if(self.rshade == false){
		self.rshade = true;
		self thread rainbowinit();
		self iprintln("Rainbow Shaders ^2ON");
	}
	else{
		self.rshade = false;
		self notify("stoprain");
		self.menu.scroller FadeOverTime(0.3);
		self.menu.scroller.color = (0, 0, 1);
		self.menu.background FadeOverTime(0.3);
		self.menu.background.color = (0, 0, 1);
		self.menu.SideLine1 FadeOverTime(0.3);
		self.menu.SideLine1.color = (0, 0, 1);
		self.menu.SideLine2 FadeOverTime(0.3);
		self.menu.SideLine2.color = (0, 0, 1);
		self iprintln("Rainbow Shaders ^1OFF");
	}
}
rainbowinit(){
	self endon("stoprain");
	self endon("disconnect");
	for(;;){
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (0, 0.5, 0);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (0, 0.5, 0);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (0, 0.5, 0);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (0, 0.5, 0);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (0.5, 1, 0);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (0.5, 1, 0);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (0.5, 1, 0);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (0.5, 1, 0);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (1, 0.5, 0.5);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (1, 0.5, 0.5);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (1, 0.5, 0.5);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (1, 0.5, 0.5);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (0.5, 1, 1);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (0.5, 1, 1);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (0.5, 1, 1);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (0.5, 1, 1);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (0.5, 1, 0.5);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (0.5, 1, 0.5);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (0.5, 1, 0.5);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (0.5, 1, 0.5);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (1, 0.5, 1);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (1, 0.5, 1);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (1, 0.5, 1);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (1, 0.5, 1);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (0.5, 0.5, 0.5);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (0.5, 0.5, 0.5);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (0.5, 0.5, 0.5);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (0.5, 0.5, 0.5);
		wait 1;
		self.menu.scroller FadeOverTime(0.5);
		self.menu.scroller.color = (1, 0, 1);
		self.menu.background FadeOverTime(0.5);
		self.menu.background.color = (1, 0, 1);
		self.menu.SideLine1 FadeOverTime(0.5);
		self.menu.SideLine1.color = (1, 0, 1);
		self.menu.SideLine2 FadeOverTime(0.5);
		self.menu.SideLine2.color = (1, 0, 1);
	}
}










