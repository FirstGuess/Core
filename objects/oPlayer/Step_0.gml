// Movement

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_shift = keyboard_check(vk_lshift)
key_a = keyboard_check(ord("A"))

vsp = vsp + grv;

var move = key_right - key_left;
hsp = move*walksp + (key_shift*2*sign(move))


ground_collision = place_meeting(x,y+vsp,oWall)
wall_collision = place_meeting(x+hsp,y,oWall)
ledge_collision = position_meeting(x, y, Ledge)

if (wall_collision)
{
	hsp = 0
}

x+=hsp

show_debug_message(ledge_collision)

// Vertical Movement

if (ground_collision)
{
	if (vsp > 0) vsp = distance_to_object(oWall)-1
	if (vsp < 0) vsp = distance_to_object(oWall)-1
}

if (ledge_collision)
{
	vsp+=-jump
	
	sprite_index = scott_vault
	image_speed = 1
}

if (key_jump)
{
	vsp=0
	
	vsp+=-jump
}

y+=vsp

// Animation


if (hsp > 0 && ground_collision) 
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
else if (hsp < 0 && ground_collision) 
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
else if (key_jump)
{
	
	sprite_index = scott_jump
	image_index = 0
	image_speed = .5
}
else if (ground_collision) 
{
	sprite_index = scott_idle
	image_speed = 1
}