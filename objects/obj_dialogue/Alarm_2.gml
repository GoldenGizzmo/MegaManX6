/// @description Right Mugshot Blinking

if right_blink < 3
{
	right_blink++;
	alarm[2] = 5;
}
else
{
	right_blink = 0;
	alarm[2] = random_range(60*2,60*10);
}