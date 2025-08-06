/// @description Insert description here
// You can write your code in this editor

switch pickup_type
{
	case 0:
		if global.life+pickup_power < global.lifemax
			global.life += pickup_power;
		else 
		{
			global.life = global.lifemax;
			//subtank stuff here
		}
		break;
}

instance_destroy();














