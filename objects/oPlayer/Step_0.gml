// Movement

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;

hsp = move*walksp;
vsp = vsp + grv;

ground_collision = place_meeting(x,y+sign(vsp),oWall)

if (ground_collision)
{
	vsp = 0
}

show_debug_message(hsp)
show_debug_message(vsp)


if (place_meeting(x,y+1,oWall) && key_jump)
{
	vsp+=-jump
}

if (place_meeting(x+1,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x+=sign(hsp)	
	}
	hsp = 0
}


if (place_meeting(x,y+sign(vsp),oWall))
{
	while (place_meeting(x,y,oWall))
	{
		y-=1	
	}
	vsp = 0
}

// Tickers
x+=hsp
y+=vsp

// Animation

if (hsp > 0) 
{
	sprite_index = scott_walk; 
	image_xscale=1;
}
else if (hsp < 0) 
{
	sprite_index = scott_walk
	image_xscale=-1;
}
else sprite_index = scott_idle
