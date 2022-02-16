ForgeMode(){
	if (self.forgeon == 0){
		self thread forgemodeon();
		self iprintln("^7Forge Mode ^2ON ^1- ^7Hold [{+speed_throw}] to Move Objects");
		self.forgeon = 1;
	}
	else{
		self notify("stop_forge");
		self iprintln("^7Forge Mode ^1OFF");
		self.forgeon = 0;
	}
}
forgemodeon(){
	self endon("death");
	self endon("stop_forge");
	while (self adsbuttonpressed()){
		trace = bullettrace(self gettagorigin("j_head"), self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 1000000, 1, self);
		while (self adsbuttonpressed()){
			trace["entity"] setorigin(self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 200);
			trace["entity"].origin = self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 200;
			wait 0.05;
		}
	}
wait 0.05;
}







