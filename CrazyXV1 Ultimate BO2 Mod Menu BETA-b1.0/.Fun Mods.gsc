DoubleSpd(){
	if (self.ps == 0){
		self.ps = 1;
		self iprintln("x2 Speed: ^2ON");
		self setmovespeedscale(2);
	}
	else{	
		self.ps = 0;
		self iprintln("x2 Speed: ^1OFF");
		self setmovespeedscale(1);
	}
}
gravity(){
	if( self.grav == 1 ){
		setdvar( "bg_gravity", "150" );
		self.grav = 0;
		self iprintln( "Gravity ^2ON" );
	}
	else{
		setdvar( "bg_gravity", "800" );
		self.grav = 1;
		self iprintln( "Gravity ^1OFF" );
	}
}
DriveableCar()
{
	if( !(IsDefined( self.car[ "spawned"] )) )
	{
		self thread closemenu();
		setdvar( "cg_thirdPersonRange", "300" );
		self.car["carModel"] = "veh_t6_drone_rcxd";
		self.car["spawned"] = 1;
		self.car["runCar"] = 1;
		self.car["spawnPosition"] += vector_scale( anglestoforward( ( 0, self getplayerangles()[ 1], self getplayerangles()[ 2] ) ), 100 );
		self.car["spawnAngles"] = ( 0, self getplayerangles()[ 1], self getplayerangles()[ 2] );
		self.car["carEntity"] = spawn( "script_model", self.car[ "spawnPosition"] );
		self.car[ "carEntity"].angles = self.car[ "spawnAngles"];
		self.car[ "carEntity"] setmodel( self.car[ "carModel"] );
		wait 0.2;
		thread vehicle_wait_think();
	}
	else
	{
		iprintln( "You Can Only Spawn One Car At A Time!" );
	}

}

vehicle_wait_think()
{
	self endon( "disconnect" );
	self endon( "end_car" );
	while( self.car[ "runCar"] )
	{
		if( distance( self.origin, self.car[ "carEntity"].origin ) < 120 )
		{
			if( self usebuttonpressed() )
			{
				if( !(self.car[ "inCar"]) )
				{
					iprintln( "Press [{+attack}] To Accelerate" );
					iprintln( "Press [{+speed_throw}] To Reverse/Break" );
					iprintln( "Press [{+reload}] To Exit Car" );
					self.car["speed"] = 0;
					self.car["inCar"] = 1;
					self disableweapons();
					self detachall();
					self setorigin( ( self.car[ "carEntity"].origin + anglestoforward( self.car[ "carEntity"].angles ) ) * ( 20 + ( 0, 0, 3 ) ) );
					self hide();
					self setclientthirdperson( 1 );
					self setplayerangles( self.car[ "carEntity"].angles + ( 0, 0, 0 ) );
					self playerlinkto( self.car[ "carEntity"] );
					thread vehicle_physics_think();
					thread vehicle_death_think();
					wait 1;
				}
				else
				{
					thread vehicle_exit_think();
				}
			}
		}
		wait 0.05;
	}

}

vehicle_physics_think()
{
	self endon( "disconnect" );
	self endon( "end_car" );
	self.car["speedBar"] = drawbar( ( 1, 1, 1 ), 100, 7, "", "", 0, 170 );
	carphysics = undefined;
	cartrace = undefined;
	newcarangles = undefined;
	while( self.car[ "runCar"] )
	{
		carphysics = ( self.car[ "carEntity"].origin + anglestoforward( self.car[ "carEntity"].angles ) * self.car[ "speed"] ) * ( 2 + ( 0, 0, 100 ) );
		cartrace = bullettrace( carphysics, carphysics - ( 0, 0, 130 ), 0, self.car[ "carEntity"] )[ "position"];
		if( self attackbuttonpressed() )
		{
			if( self.car[ "speed"] < 0 )
			{
				self.car["speed"] = 0;
			}
			if( self.car[ "speed"] < 50 )
			{
				self.car["speed"] += 0.4;
			}
			newcarangles = vectortoangles( cartrace - self.car[ "carEntity"].origin );
			self.car[ "carEntity"] moveto( cartrace, 0.2 );
			self.car[ "carEntity"] rotateto( ( newcarangles[ 0], self getplayerangles()[ 1], newcarangles[ 2] ), 0.2 );
		}
		else
		{
			if( self.car[ "speed"] > 0 )
			{
				newcarangles = vectortoangles( cartrace - self.car[ "carEntity"].origin );
				self.car["speed"] -= 0.7;
				self.car[ "carEntity"] moveto( cartrace, 0.2 );
				self.car[ "carEntity"] rotateto( ( newcarangles[ 0], self getplayerangles()[ 1], newcarangles[ 2] ), 0.2 );
			}
		}
		if( self adsbuttonpressed() )
		{
			if( self.car[ "speed"] > -20 )
			{
				if( self.car[ "speed"] < 0 )
				{
					newcarangles = vectortoangles( self.car[ "carEntity"].origin - cartrace );
				}
				self.car["speed"] -= 0.5;
				self.car[ "carEntity"] moveto( cartrace, 0.2 );
			}
			else
			{
				self.car["speed"] += 0.5;
			}
			self.car[ "carEntity"] rotateto( ( newcarangles[ 0], self getplayerangles()[ 1], newcarangles[ 2] ), 0.2 );
		}
		else
		{
			if( self.car[ "speed"] < -1 )
			{
				if( self.car[ "speed"] < 0 )
				{
					newcarangles = vectortoangles( self.car[ "carEntity"].origin - cartrace );
				}
				self.car["speed"] += 0.8;
				self.car[ "carEntity"] moveto( cartrace, 0.2 );
				self.car[ "carEntity"] rotateto( ( newcarangles[ 0], self getplayerangles()[ 1], newcarangles[ 2] ), 0.2 );
			}
		}
		self.car[ "speedBar"] updatebar( self.car[ "speed"] / 50 );
		wait 0.05;
	}

}

vehicle_death_think()
{
	self endon( "disconnect" );
	self endon( "end_car" );
	self waittill( "death" );
	if( self.car[ "inCar"] )
	{
		thread vehicle_exit_think();
	}
	else
	{
		self.car[ "carEntity"] delete();
	}
	wait 0.2;

}

vehicle_exit_think()
{
	self.car["speed"] = 0;
	self.car["inCar"] = 0;
	self.car["runCar"] = 0;
	self.car["spawned"] = undefined;
	self.car[ "speedBar"] destroyelem();
	self.car[ "carEntity"] delete();
	self unlink();
	self enableweapons();
	self show();
	self setclientthirdperson( 0 );
	wait 0.3;
	self notify( "end_car" );

}
togglesuperjump()
{
	if( !(IsDefined( !(level.superjump) )) )
	{
		level.superjump = 1;
		i = 0;
		while( i < level.players.size )
		{
			level.players[ i] thread superjumpenable();
			i++;
		}
		break;
	}
	else
	{
		level.superjump = undefined;
		x = 0;
		while( x < level.players.size )
		{
			level.players[ x] notify( "StopJump" );
			x++;
		}
	}
	self iprintln( "Super Jump: Enabled/Disabled" );

}

toggle_timescales()
{
	if( self.timescales == 0 )
	{
		self.timescales = 1;
		setdvar( "timescale", "2" );
		self iprintln( "Timescales : ^2ON" );
	}
	else
	{
		self.timescales = 0;
		setdvar( "timescale", "1" );
		self iprintln( "Timescales : ^1OFF" );
	}

}







