/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case "Openning":
		switch (action)
		{
			case 0:
				if y < obj_player.y-40
				{
					alarm[0] = 1;
					
					yspeed = 1;
				}
				else
				{
					alarm[0] = 1
					
					yspeed = 0;
				}
				break;
				
			case 1:
				with obj_bossmanager
				{
					bossfight_state++;
					alarm[0] = 60;
				}
				break;
		}
		break;

}














