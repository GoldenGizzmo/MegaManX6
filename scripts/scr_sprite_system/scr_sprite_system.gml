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
	
	animation_end = function(){
		
		if(typeof(current_sprite) == "struct"){
			current_sprite.update(obj);
			return;
		}
		
		switch(loop_type){
			
			case sprite_loop_type.no_loop:
				
				obj.image_speed = 0;
				obj.image_index = obj.image_number - 1;
				
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
		
		show_debug_message($"yeah {current_sprite}")
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
	
	#region sisters
		
		if(typeof(new_sprite) == "struct"){
			if(typeof(spr_manager.current_sprite) == "struct"){
				
				var size = array_length(new_sprite.sisters)
				
				for(var i = 0; i < size; i++){
					
					var sis = new_sprite.sisters[i]; 
					
					show_debug_message($"{sis}")
					
					if(sis[0] == spr_manager.current_sprite.name){
						sync_type = sis[1];
						break;
					}
				}
			}
		}
	
	#endregion
	
	#region update variables if needed
	
		spr_manager.loop_type = loop_t;
		spr_manager.current_sprite = new_sprite;
	
	#endregion
	
	#region actually change the sprite
	
		if(typeof(new_sprite) == "struct"){
			new_sprite = loop ? new_sprite.loop_sprite : new_sprite.start_sprite;
			
		}
	
		//if(new_sprite == sprite_index)return;
		
		var image = image_index;
		sprite_index = new_sprite;
		image_speed = 1;
		image_index = 0;
	
		switch(sync_type){
		
			case animation_sync_type.match_image:
				image_index = image;
			break;
		
		}
	
	#endregion
	
}

function scr_setup_player_sprites(){
	
	
	spr_manager.add_custom_sprite("move", spr_port_x_move_start, spr_port_x_move_loop, undefined, undefined, [["shoot_move", animation_sync_type.match_image]])
	spr_manager.add_custom_sprite("shoot_move", spr_port_x_move_shooting_start, spr_port_x_move_shooting_loop, undefined, undefined, [["move", animation_sync_type.match_image]])
	spr_manager.add_custom_sprite("land", spr_port_x_landing, spr_port_x_idle)
	
	var airborne_check = function(){
		
		if(!airborne)return false;

		var cooldown = shooting ? 60 : 0;

		if(yspeed >= 0){
			
			change_sprite(spr_manager, shooting ? spr_port_x_falling_shooting  : spr_port_x_falling, animation_sync_type.base, sprite_loop_type.no_loop, cooldown)
			
		}
		else
		{
			change_sprite(spr_manager, shooting ? spr_port_x_jump_rise_shooting : spr_port_x_jump_rise, animation_sync_type.base, sprite_loop_type.no_loop, cooldown)
		}
		
		
		return true;
	}
	
	var wall_check = function(){
		
		if(!wall_slide)return false;
		
		if(shooting){
			change_sprite(spr_manager, spr_port_x_walljump_shooting, sprite_index == spr_port_x_walljump ? animation_sync_type.match_image : animation_sync_type.base, sprite_loop_type.no_loop)
		}
		else
		{
			change_sprite(spr_manager, spr_port_x_walljump, sprite_index == spr_port_x_walljump_shooting ? animation_sync_type.match_image : animation_sync_type.base, sprite_loop_type.no_loop)
		}
		
		return true;
		
	}
	
	var move_check = function(){

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
			
			if(sprite_index == spr_port_x_falling or sprite_index == spr_port_x_falling_shooting){
				change_sprite(spr_manager, "land")
			}
			else
			{
				
				if(shooting){
					change_sprite(spr_manager, spr_port_x_idle_shoot, global.input_shoot ? animation_sync_type.override : animation_sync_type.base, sprite_loop_type.no_loop);
				}
				else
				{
					change_sprite(spr_manager, spr_port_x_idle);
				}
			}
		}
		
		
		return true;
	}
	
	spr_manager.add_check(10, wall_check)
	spr_manager.add_check(5, airborne_check)
	spr_manager.add_check(1, move_check)
	
}