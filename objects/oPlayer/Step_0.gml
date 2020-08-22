// Movement

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_shift = keyboard_check(vk_lshift)

vsp = vsp + grv;

var move = key_right - key_left;
hsp = move*walksp + (key_shift*2*sign(move))


ground_collision = place_meeting(x,y+vsp,oWall)
wall_collision = place_meeting(x+hsp,y,oWall)

if (wall_collision)
{
	hsp = 0
}

x+=hsp

// Vertical Movement

if (ground_collision)
{
	if (vsp > 0) vsp = distance_to_object(oWall)-1
	if (vsp < 0) vsp = distance_to_object(oWall)-1
}

if (key_jump)
{
	vsp=0
	
	vsp+=-jump
	
	sprite_index = scott_jump
	image_index = 0
	image_speed = 0
}

y+=vsp

// Animation

if (hsp > 0) 
{
	if (key_shift)
	{
		sprite_index = scott_run
		image_xscale=1;
		image_speed = 1
	}
	else
	{
		sprite_index = scott_walk; 
		image_xscale=1;
		image_speed = 1
	}
}
else if (hsp < 0) 
{
	if (key_shift)
	{
		sprite_index = scott_run
		image_xscale=-1
		image_speed = 1
	}
	else
	{
		sprite_index = scott_walk
		image_xscale=-1;
		image_speed = 1
	}
}
else if (vsp == 0 && !(place_meeting(x,y+1,oWall) && key_jump)) 
{
	sprite_index = scott_idle
	image_speed = 1
}