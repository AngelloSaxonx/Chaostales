//step
if (hp > hp_max) || (hp < 0)
{
	hp = hp_max
}
if keyboard_check_pressed(ord("P"))
{
	hp--;
}