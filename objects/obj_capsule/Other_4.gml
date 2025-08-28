/// @description Check if upgrade is already acquired

var acquired = false;
switch (upgrade)
{
	case "Blade Head": if global.blade_head_get = true {acquired = true;} break;
	case "Blade Chest": if global.blade_chest_get = true {acquired = true;} break;
	case "Blade Arm": if global.blade_arm_get = true {acquired = true;} break;
	case "Blade Leg": if global.blade_leg_get = true {acquired = true;} break;
	
	case "Shadow Head": if global.shadow_head_get = true {acquired = true;} break;
	case "Shadow Chest": if global.shadow_chest_get = true {acquired = true;} break;
	case "Shadow Arm": if global.shadow_arm_get = true {acquired = true;} break;
	case "Shadow Leg": if global.shadow_leg_get = true {acquired = true;} break;
}

//Turn off
if acquired = true
{
	state = 99;
	active = false;
}