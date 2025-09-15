/// @description Left Mugshot Blinking

if blink < 3
{
	blink++;
	alarm[1] = 5;
}
else
{
	blink = 0;
	alarm[1] = random_range(60*2,60*10);
}