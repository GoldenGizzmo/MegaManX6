/// @description Insert description here
// You can write your code in this editor

if fade_away = 0 and invul = false
{
	if other.sprite_index = spr_bullet_genmu
		life = 0;
	else if other.villainy != 2 and (other.damage > 10 or other.melee = true)
		fade_away = 1;
	else
	{
		armour = true
		event_inherited();
	}
}
