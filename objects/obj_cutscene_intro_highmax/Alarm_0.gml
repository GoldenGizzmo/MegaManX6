/// @description Insert description here
// You can write your code in this editor

switch (action)
{
	case 0:
		if obj_player.airborne = false
		{
			action++;
			alarm[0] = 120;
		}
		else
			alarm[0] = 1
		break;

	case 1:
		action++;
		alarm[0] = 10;
		
		conversation = instance_create_depth(0,0,0,obj_dialogue);
		conversation.dialogue = "High Max Intro";
		conversation.movement = false;
		break;
		
	case 2:
		if !instance_exists(obj_dialogue)
		{
			action++;
			alarm[0] = 30;
		}
		else
			alarm[0] = 1;
		break;
		
	case 3:
		with inst_7C40EC40
		{
			//x = obj_player.x;
			y = obj_player.y;
		}
			
		instance_destroy();
		break;
}