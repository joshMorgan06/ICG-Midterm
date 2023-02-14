Josh Morgan (100824998)

*
*
*

Models/Environment:
	The Islands and Lighthouse models were made by me (blend files in file folder). The spaceship model was provided by the University in a Programming for Games 1 Lecture.

Toon Lighting/Shader:
	I tried utilizing a numerous amount of ramp textures for the shader in this project. I ended up using one that has only to value or "steps". Those being a dark grey and
	plain white. I used this because you don't usually see a number of steps of light being used in real 2D animation. It's typically just the light shade and the shadow on
	the object/character. Too many steps or detail can possibly take away or subtract the cartoonish effect.

	I added in Rim Lighting to the toon shader for the hit indication effect when the player runs into the enemy.The rim light is red because this is typically the colour
	used when something bad happens.The "Rim Power" float is changed for a quick second when the enemy collides with the player, and gets reset after 0.5s using an
	IEnumerator.

Other Scripts:
	All other (Player movement and behaviour, and enemy movement) are scripts I've made. The enemy movement is simply lerping the enemies position between two points back
	and forth. The player behaviour is simply the rim power effect mentioned previously.