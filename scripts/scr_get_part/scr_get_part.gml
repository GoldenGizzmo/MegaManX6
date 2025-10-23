// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_part(_id)
{
	part_name = "Unknown";
	part_description = "Dude, I have no idea what this is";
	part_cost = 0;
	switch (_id)
	{
		case 0:
			part_name = "Super Recover";
			part_description = "Increases health gained from life \npickups by 50%";
			part_cost = 100;
			break;	
			
		case 1:
			part_name = "Rapid Fire";
			part_description = "Increases the maximum amount of \nprojectiles that can appear at once";
			part_cost = 50;
			break;	
			
		case 2:
			part_name = "Hyper Dash";
			part_description = "Inceases the speed and length of your dash by 20%";
			part_cost = 200;
			break;	
			
		case 3:
			part_name = "Saber Plus";
			part_description = "Increases the damage of your saber \nslashes by 25%";
			part_cost = 300;
			break;
			
		case 4:
			part_name = "V Shot";
			part_description = "Your buster instead fires two \nprojectiles in an outward spread";
			part_cost = 100;
			break;
			
		case 5:
			part_name = "Life Siphon";
			part_description = "Absorb life energy from destroyed \nenemies";
			part_cost = 100;
			break;
		
		/*	
		case 0:
			part_name = "Speedster";
			part_description = "Increases your movement speed by 50%";
			part_cost = 150;
			break;
		case 1:
			part_name = "Jumper";
			part_description = "Increases the height of your jumps by 25%";
			part_cost = 200;
			break;	
		case 3:
			part_name = "Energy Saver";
			part_description = "Reduces to cost of your special weapons by 50%";
			part_cost = 100;
			break;		
		case 5:
			part_name = "Buster Plus";
			part_description = "Increases the damage of your buster projectiles by 25%";
			part_cost = 500;
			break;		
		case 7:
			part_name = "Shock Buffer";
			part_description = "Prevents knockback and reduces taken damage by 25%";
			part_cost = 150;
			break;		
		case 8:
			part_name = "Shot Eraser";
			part_description = "Your saber can slash through most non-piercing projectiles";
			part_cost = 50;
			break;		
		case 9:
			part_name = "Weapon Plus";
			part_description = "Increases the damage of your special weapons and techniques by 25%";
			part_cost = 500;
			break;	*/
	}
}

function scr_get_part_effect(_id,tweak)
{
	switch (_id)
	{
		case 0: //Part: Super Recover
			if pickup_type = 0
			{
				var increase = 1.5;

				switch (sprite_index)
				{
					case spr_pickup_health_small: 
						pickup_power = ceil(pickup_power*increase);
						sprite_index = spr_pickup_health_small_super; 
						break;
					case spr_pickup_health_mid: 
						pickup_power = ceil(pickup_power*increase);
						sprite_index = spr_pickup_health_mid_super; 
						break;
					case spr_pickup_health_siphon: 
						pickup_power = ceil(pickup_power*increase);
						sprite_index = spr_pickup_health_siphon_super; 
						afterimage_colour = make_color_rgb(25,84,127);
						break;
				}
			}
			break;
			
		case 1: //Part: Rapid Fire
			switch (tweak)
			{
				case "Set Colour": //Set the colour of the shooting projectile
					palette_type = spr_bullet_x_palette;
					palette = 1;
					break;	
				
				case "X-Buster":
					bullet_limit = 5;
					break;
			
				case "Meteor Rain":
					bullet_limit_special = 2;
					break;
					
				case "Ray Arrow":
					bullet_limit_special = 3;
					break;
			}
			break;
			
		case 2: //Part: Hyper Dash
			dash_speed *= 1.2;
			break;
			
		case 3: //Part: Saber Plus
			palette = 1;
			melee_damage = ceil(melee_damage*1.25);
			break;
			
		case 4: //Part: V Shot
			var v_angle = 30;
			with bullet
			{
				direction -= v_angle;
				image_angle = direction;
				
				instance_copy(false); 
				
				direction += v_angle*2;
				image_angle = direction;
			}
			break;
			
		case 5: //Part: Life Siphon
			var spawn = false; //Check if the player actually need weapon energy
			
			if global.life < global.lifemax
				spawn = true;
			else
			{
				if global.subtank_1 > -1 and global.subtank_1 < global.tank_cap
					spawn = true;
				else if global.subtank_2 > -1 and global.subtank_2 < global.tank_cap
					spawn = true;
			}
				
			if spawn = true
			{
				pickup = instance_create_layer(x,y,"Instances",obj_pickup);
				pickup.speed = 4;
				pickup.direction = 180+point_direction(x,y,obj_player.x,obj_player.y);
				pickup.sprite_index = spr_pickup_health_siphon;
				
			}
			/*
			//If selected special weapon is not at max and not the X-Saber
			if global.weapon[global.weapon_choice].ammo < global.weapon[global.weapon_choice].ammo_max and global.weapon_choice != 0
				spawn = true;
			else
			{
				//Check all the other special weapons and fill them instead
				for (var i = 1; i < array_length(global.weapon); i++)
					if global.weapon[i].ammo < global.weapon[i].ammo_max
						spawn = true;
			}
			
			//Check weapon tank is aquired and not full
			if global.weapontank > -1 and global.weapontank < global.tank_cap
				spawn = true;
			
			if spawn = true
			{
				pickup = instance_create_layer(x,y,"Instances",obj_pickup);
				pickup.speed = 4;
				pickup.direction = irandom(359);
				pickup.sprite_index = spr_pickup_energy_siphon;
			}*/
			break;
	}
}

function scr_part_storestock()
{
	//Go through ever level in the list thats completed
	ds_list_sort(global.level_list,true);
	ds_list_clear(global.parts_store); //Start from scratch 
	for (var i = 0; i < ds_list_size(global.level_list); i++)
	{	
		switch (ds_list_find_value(global.level_list,i))
		{
			case rm_yammark:
				//Super Recover
				if ds_list_find_value(global.parts_owned,0) != -1 {ds_list_add(global.parts_store,0)}
				//Rapid Shot
				if ds_list_find_value(global.parts_owned,1) != -1 {ds_list_add(global.parts_store,1)}
				//Life Siphon
				if ds_list_find_value(global.parts_owned,5) != -1 {ds_list_add(global.parts_store,5)}
				break;
				
			case rm_turtloid:
				//Hyper Dash
				if ds_list_find_value(global.parts_owned,2) != -1 {ds_list_add(global.parts_store,2)}
				//Saber Plus
				if ds_list_find_value(global.parts_owned,3) != -1 {ds_list_add(global.parts_store,3)}
				//V Shot
				if ds_list_find_value(global.parts_owned,4) != -1 {ds_list_add(global.parts_store,4)}
				break;
			/*	
			Heatnix:
				Buster Plus
				Ultimate Buster
				Max Power
				
			Mijinion:
				Damage Converter
				Low Power
				Climber
			
			Sharkplayer:
				Saber Extend
				Shock Buffer
				Soul Converter
			
			Scaravich:
				Speedster
				Quick Charge
				Virus Buster
			
			Wolfang:
				Jumper
				Shot Eraser
				Maverick Hunter
			
			Sheldon:
				Energy Saver
				Double Barrier
				Weapon Plus
			
			Progression:
				Starting
					Wall Dash
					
					
				4 Investigators
					Spare Dash
					Death Blocker
					
				Gate's Lab
					
			
			*/
		}
	}
}