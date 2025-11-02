// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function sprite_manager(_id) constructor{
	
	obj = _id;
	
	checks = [];
	custom_sprites = [];
	
	checks_size = 0;
	custom_sprites_size = 0;
	
	current_sprite = noone;
	loop_type = sprite_loop_type.base
	
	sprite_cooldown = 0;
	
	finished = true;
	
	reverse = false;
	
	
	
	/*
	sprite_delay = 0;
	sprite_delay_loop_type = sprite_loop_type.base;
	sprite_delay_target = noone;
	*/
	
	add_check = function(priority, chk){
		
		
		var ch = new sprite_check(priority, chk)
		
		for(var i = 0; i < checks_size; i++){
			
			var c = checks[i];
			
			if(c.priority < priority){
				array_insert(checks, i, ch)
				checks_size += 1;
				return;
			}
			
		}
		
		array_push(checks, ch)
		checks_size += 1;
	}
	
	reverse_animation = function(){
		
		if(reverse)return;
		
		reverse = true;
		finished = false;
		obj.image_speed = -1;
	}
	
	animation_end = function(){
		
		finished = true;
		
		if(typeof(current_sprite) == "struct"){
			current_sprite.update(obj);
			return;
		}
		
		switch(loop_type){
			
			case sprite_loop_type.no_loop:
				
				obj.image_speed = 0;
				obj.image_index = reverse ? 0 : obj.image_number - 1;
				
			break;
			
		}
		
		
	}
	
	add_custom_sprite = function(name, start_sprite, loop_sprite, sync_type = animation_sync_type.base, loop_type = sprite_loop_type.base, sisters = []){
		
		var spr = new custom_sprite(name, start_sprite, loop_sprite, sync_type, loop_type, sisters);
		
		array_push(custom_sprites, spr)
		custom_sprites_size += 1;
	}
	
	find_custom_sprite = function(name){
		
		for(var i = 0; i < custom_sprites_size; i++){
			
			var c_s = custom_sprites[i];
			if(c_s.name == name)return c_s;
			
		}
		
	}
	
	update = function(){
		
		sprite_cooldown = clamp(sprite_cooldown - 1, 0, sprite_cooldown);
		
		
		for(var i = 0; i < checks_size; i++){
			
			var chk = checks[i];
			
			if(chk.run())break;
			
		}
	}
	
}


function sprite_check(priority, check) constructor{
	
	self.priority = priority;
	self.check = check;
	
	run = check;
}

function custom_sprite(name, start_sprite, loop_sprite, sync_type = animation_sync_type.base, loop_type = sprite_loop_type.base, sisters = []) constructor{
	
	self.name = name;
	self.start_sprite = start_sprite;
	self.sync_type = sync_type;
	self.loop_sprite = loop_sprite;
	self.loop_type = loop_type;
	self.sisters = sisters;
	
	update = function(obj){
		
		
		with(obj)change_sprite(spr_manager, other, other.sync_type, other.loop_type, true)
		
	}
	
}

function change_sprite(spr_manager, new_sprite, sync_type = animation_sync_type.base, loop_t = sprite_loop_type.base, loop = false){
	
	var override = sync_type == animation_sync_type.override;
	
	if(spr_manager.sprite_cooldown > 0 and !override)return;
	
	#region Get the struct if the new sprite is given as a string
	
		if(typeof(new_sprite) == "string"){
			new_sprite = spr_manager.find_custom_sprite(new_sprite);
			loop_t = new_sprite.loop_type;
			sync_type = new_sprite.sync_type;
		}
	
	#endregion
	
	#region take care of delayed sprite changes
		
		
		if(!override){
			
			if(!loop and spr_manager.current_sprite == new_sprite){
				
				return;
			}
		
			if(typeof(spr_manager.current_sprite) == "struct" and spr_manager.current_sprite.loop_sprite == new_sprite){
				return;
			}
		}
	
	/*
		if(delay > 0){
		
			if(new_sprite == sprite_delay_target and sprite_delay > 0)return;
		
			spr_manager.sprite_delay = delay;
			spr_manager.sprite_delay_loop_type = loop_t;
			spr_manager.sprite_delay_target = new_sprite;
		
			return;
		}
	*/
	
	#endregion
	
	#region actually change the sprite
	
		if(typeof(new_sprite) == "struct"){
			
			#region sisters
		
			if(typeof(spr_manager.current_sprite) == "struct"){
				
				var size = array_length(new_sprite.sisters)
				
				for(var i = 0; i < size; i++){
					
					var sis = new_sprite.sisters[i];
					
					if(sis.name == spr_manager.current_sprite.name){
						sync_type = sis.sync_type;
						loop = (sprite_index == spr_manager.current_sprite.loop_sprite);
						break;
					}
				}
			}
			
			#region update variables if needed
	
				spr_manager.loop_type = loop_t;
				spr_manager.current_sprite = new_sprite;
	
			#endregion
			
			new_sprite = loop ? new_sprite.loop_sprite : new_sprite.start_sprite;
		}
		else
		{
			
			#region update variables if needed
	
				spr_manager.loop_type = loop_t;
				spr_manager.current_sprite = new_sprite;
	
			#endregion
			
		}
		
	
		//if(new_sprite == sprite_index)return;
		
		var image = image_index;
		if(new_sprite != sprite_index){
			spr_manager.reverse = false;
		}
		
		sprite_index = new_sprite;
		image_speed = spr_manager.reverse ? -1 : 1;
		image_index = 0;
	
		switch(sync_type){
		
			case animation_sync_type.match_image:
				image_index = image;
			break;
			
			case animation_sync_type.last:
				image_index = sprite_get_number(sprite_index) - 1;
			break;
		
		}
		
		spr_manager.finished = false;
	
	#endregion	
}

#region sprite sisters

	function sprite_sister(name, sync_type = animation_sync_type.match_image){
	
		return new sprite_sister_struct(name, sync_type)
	}

	function sprite_sister_struct(name, sync_type) constructor{
		self.name = name;
		self.sync_type = sync_type;
	}

#endregion

function scr_setup_player_sprites(){
	
	#region Custom Sprites
	
		//This is where we can add the custom sprites
		//Custom sprites have a start sprite, and a loop sprite.
		
		//You can also see that these have an array of "sprite_sister" objects
		//This is he way you tell the system that two or more sprites are basically the same, and such, when transitioning between them, it should automatically make EVERYTHING match.
	
		spr_manager.add_custom_sprite("move", spr_port_x_move_start, spr_port_x_move_loop, undefined, undefined, [sprite_sister("shoot_move")])
		spr_manager.add_custom_sprite("shoot_move", spr_port_x_move_start_shooting, spr_port_x_move_loop_shooting, undefined, undefined, [sprite_sister("move")])
		
		//spr_manager.add_custom_sprite("land", spr_port_x_landing, spr_port_x_idle, undefined, undefined, [sprite_sister("shoot_land")])
		//spr_manager.add_custom_sprite("shoot_land", spr_port_x_landing, spr_port_x_idle, undefined, undefined, [sprite_sister("land")])
	
		spr_manager.add_custom_sprite("dash", spr_port_x_dash, spr_port_x_dash_loop, undefined, undefined, [sprite_sister("shoot_dash")])
		spr_manager.add_custom_sprite("shoot_dash", spr_port_x_dash_shooting, spr_port_x_dash_shooting_loop, undefined, undefined, [sprite_sister("dash")])
	#endregion
	
	
	#region Checks
	
		//Each one of these functions will be run every frame, in order of priority (which is set later)
		//They MUST return either true or false, "false" means the system should run the following check, "true" means it should stop here.
	
		var airborne_check = function(){
		
			if(!airborne)return false;

			if(attack_action == attack_actions.x_saber or !scr_sprite_finished(spr_manager, spr_port_x_saber_jump)){
			
				change_sprite(spr_manager, spr_port_x_saber_jump, animation_sync_type.base, sprite_loop_type.no_loop);
			}
			else{

				if(yspeed >= 0){
			

						change_sprite(spr_manager, shooting ? spr_port_x_falling_shooting : spr_port_x_falling, scr_current_sprite_is([spr_port_x_falling, spr_port_x_falling_shooting]) ? animation_sync_type.match_image : animation_sync_type.base, sprite_loop_type.no_loop)
				}
				else
				{
					change_sprite(spr_manager, shooting ? spr_port_x_jump_shooting : spr_port_x_jump, scr_current_sprite_is([spr_port_x_jump, spr_port_x_jump_shooting]) ? animation_sync_type.match_image : animation_sync_type.base, sprite_loop_type.no_loop)
				}
			}
		
			return true;
		}
	
		var damage_check = function(){
		
			if(!hurt)return false;
		
			change_sprite(spr_manager, spr_port_x_hurt)
		
		
			return true;
		}
	
		var dash_check = function(){
		
			if(!dash)return false;
		
		
			if(shot_fired){
				change_sprite(spr_manager, "shoot_dash")
			}
			else
			{
				change_sprite(spr_manager, "dash")
			}
		
			return true;
		}
	
		var crouch_check = function(){
		
			if(!crouch)return false;
		
			if(shooting or !scr_sprite_finished(spr_manager, [spr_port_x_crouch_shot_charged, spr_port_x_crouch_shot, spr_port_x_crouch_shooting])){
				
				if(shooting_charged == shooting_charge_level.two or !scr_sprite_finished(spr_manager, spr_port_x_crouch_shot_charged)){
					change_sprite(spr_manager, spr_port_x_crouch_shot_charged, !scr_current_sprite_is(spr_port_x_crouch_shot_charged) ? animation_sync_type.override : animation_sync_type.base, sprite_loop_type.no_loop);
				}
				/*else if(shooting or scr_current_sprite_is(spr_port_x_crouch_shot)){
					change_sprite(spr_manager, spr_port_x_crouch_shot, global.input_shoot_pressed ? animation_sync_type.override : animation_sync_type.base, sprite_loop_type.no_loop)
				}*/
				else{
					change_sprite(spr_manager, spr_port_x_crouch_shooting, sprite_index == spr_port_x_crouch ? animation_sync_type.match_image : animation_sync_type.base, sprite_loop_type.no_loop)
				}
			}
			else
			{
				change_sprite(spr_manager, spr_port_x_crouch, scr_current_sprite_is([spr_port_x_crouch_shot, spr_port_x_crouch_shooting, spr_port_x_crouch_shot_charged]) ? animation_sync_type.last : animation_sync_type.base, sprite_loop_type.no_loop)
			}
		
			return true;
		
		}
	
		var wall_check = function(){
		
			if(!wall_slide)return false;
		
			if(attack_action == attack_actions.x_saber or !scr_sprite_finished(spr_manager, spr_port_x_saber_walljump)){
			
				change_sprite(spr_manager, spr_port_x_saber_walljump, animation_sync_type.base, sprite_loop_type.no_loop);
			}
			else{
		
				if(shooting){
					change_sprite(spr_manager, spr_port_x_walljump_shooting, scr_current_sprite_is(spr_port_x_saber_walljump) ? animation_sync_type.last : (sprite_index == spr_port_x_walljump ? animation_sync_type.match_image : animation_sync_type.base), sprite_loop_type.no_loop)
				}
				else
				{
					change_sprite(spr_manager, spr_port_x_walljump, scr_current_sprite_is(spr_port_x_saber_walljump) ? animation_sync_type.last : (sprite_index == spr_port_x_walljump_shooting ? animation_sync_type.match_image : animation_sync_type.base), sprite_loop_type.no_loop)
				}
			}
		
			return true;
		
		}
	
		var move_check = function(){

			var c_sprite = spr_manager.current_sprite;
			var struct = typeof(c_sprite) == "struct"

			if(xspeed != 0){
			
				if(shooting){
					change_sprite(spr_manager, "shoot_move")
				}
				else
				{
					change_sprite(spr_manager, "move")
				}
			}
			else
			{
				
				
				if(attack_action == attack_actions.x_saber or !scr_sprite_finished(spr_manager, spr_port_x_saber)){
					change_sprite(spr_manager, spr_port_x_saber, animation_sync_type.base, sprite_loop_type.no_loop);
				}
				else if(attack_action == attack_actions.rain or !scr_sprite_finished(spr_manager, spr_port_x_idle_shoot)){
					change_sprite(spr_manager, spr_port_x_idle_shoot)
				}
				/*else if((struct and (c_sprite.name == "dash" or c_sprite.name == "shoot_dash")) or !scr_sprite_finished(spr_manager, spr_port_x_dash_end) or !scr_sprite_finished(spr_manager, spr_port_x_dash_shooting_end)){
				
					if(shooting){
						change_sprite(spr_manager, spr_port_x_dash_shooting_end, sprite_index == spr_port_x_dash_end ? animation_sync_type.match_image : animation_sync_type.base)
					}
					else
					{
						change_sprite(spr_manager, spr_port_x_dash_end, sprite_index == spr_port_x_dash_shooting_loop ? animation_sync_type.match_image : animation_sync_type.base)
					}
				
				}*/
				else if(shooting_charged == shooting_charge_level.two or !scr_sprite_finished(spr_manager, spr_port_x_idle_shoot_charge)){
					change_sprite(spr_manager, spr_port_x_idle_shoot_charge, !scr_current_sprite_is(spr_port_x_idle_shoot_charge) ? animation_sync_type.override : animation_sync_type.base, sprite_loop_type.no_loop);
				}
				else if(shot_fired or shooting_charged == shooting_charge_level.one or !scr_sprite_finished(spr_manager, spr_port_x_idle_shoot)){
					change_sprite(spr_manager, spr_port_x_idle_shoot, shot_fired ? animation_sync_type.override : animation_sync_type.base, sprite_loop_type.no_loop);
				}
				else if((scr_current_sprite_is(CROUCH_SPRITES) and !scr_sprite_is_reversed(spr_manager)) or !scr_sprite_finished(spr_manager, CROUCH_SPRITES)){
					
					if(scr_current_sprite_is(spr_port_x_crouch_shot)){
						change_sprite(spr_manager, spr_port_x_crouch_shooting, animation_sync_type.match_image, sprite_loop_type.no_loop)
					}
					
					scr_sprite_reverse(spr_manager);
				}
				else if(scr_current_sprite_is(FALLING_SPRITES) or !scr_sprite_finished(spr_manager, spr_port_x_landing)){
					change_sprite(spr_manager, spr_port_x_landing)
				}
				else
				{
					change_sprite(spr_manager, spr_port_x_idle);
				}
				
			}
		
		
			return true;
		}
	
	#endregion
	
	//Adding the checks to the sprite manager.
	//Here you can set their priority, the higher the priority, the sooner the checks will run.
	
	spr_manager.add_check(15, damage_check)
	spr_manager.add_check(10, wall_check)
	spr_manager.add_check(8, airborne_check)
	spr_manager.add_check(5, dash_check)
	spr_manager.add_check(3, crouch_check)
	spr_manager.add_check(1, move_check)
	
}

//Helper functions


//Check if the sprite is finished
//It will return true if the current sprite is the one specified, AND if the animation has finished atleast once.
//You can give an array of sprites to check
function scr_sprite_finished(spr_manager, sprite){
	
	if(typeof(sprite) == "array"){
		
		var size = array_length(sprite);
		
		var ch = true;
		
		for(var i = 0; i < size; i++){
			var spr =  sprite[i];
			
			if(sprite_index == spr){
				ch = false;
				break;
			};
		}
		
		return ch or spr_manager.finished;	
	}
	
	return sprite_index != sprite or spr_manager.finished
}

//Make the current sprite play in reverse
function scr_sprite_reverse(spr_manager){
	
	spr_manager.reverse_animation();
}

//Check if the current sprite is reversed
function scr_sprite_is_reversed(spr_manager){
	
	return spr_manager.reverse;
}


//Check if the current sprite is equal to any of the sprites given.
//You can give an array of sprites to check.
function scr_current_sprite_is(sprite){
	
	
	if(typeof(sprite) == "array"){
		
		var size = array_length(sprite);
		
		for(var i = 0; i < size; i++){
			var spr =  sprite[i];
			
			if(spr == sprite_index)return true;
		}
		
		return false;
		
	}
	
	return sprite_index == sprite
}