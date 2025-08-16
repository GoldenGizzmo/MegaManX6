/// @description Left Mugshot Blinking

if left_blink < 3
{
	left_blink++;
	alarm[1] = 5;
}
else
{
	left_blink = 0;
	alarm[1] = random_range(60*2,60*10);
}