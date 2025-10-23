// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_rank()
{
	rank_size = ds_list_size(global.rescue_list);
	rank_letter = 0; //C Rank
	global.parts_amount = 1;
	
	if rank_size > 10
	{
		rank_letter = 1; //B Ranks
		global.parts_amount = 2;
	}
	if rank_size > 25
	{
		rank_letter = 2; //A Ranks
		global.parts_amount = 3;
	}
	if rank_size > 50
	{
		rank_letter = 3; //S Ranks
		global.parts_amount = 4;
	}
	if rank_size > 90 //Change to be the max number
	{
		rank_letter = 4; //UH Ranks
		global.parts_amount = 5;
	}
}