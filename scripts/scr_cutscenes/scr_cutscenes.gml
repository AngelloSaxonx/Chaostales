global.cutscenes = {};

global.cutscenes[$ "test"] = 
[
	new scr_text("Text testing",[ #ffffff],[0],[0],[0]),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral_a, PORTRAIT_SIDE.LEFT),
	new scr_text("Floriel left testing.",[ #ffffff],[0],[0],[0]),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral_a, PORTRAIT_SIDE.RIGHT),
	new scr_text("Floriel right testing",[ #ffffff],[0],[0],[0])
]

global.cutscenes[$ "door"] = 
[
	new scr_text("It's a locked door.",[ #ffffff],[0],[0],[0])
]

global.cutscenes[$ "tomb"] = 
[
	new scr_text("It's the tomb of a deceased Monster.",[ #ffffff],[0],[0],[0])
]

//Scarlet Fields

global.cutscenes[$ "scarlet teapot"] = 
[
	new scr_text("Teapots...",[ #EE1C24],[4],[1],[7]),
	new scr_text("Meant for two lovers.",[ #197B30, #197B30],[0,3],[1,15],[5,20]),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral_a, PORTRAIT_SIDE.LEFT),
	new scr_text("Wish i'd ride one someday.",[ #EE1C24, #197B30],[1,0],[5,14],[8,17])
]

global.cutscenes[$ "rouge pastry"] = 
[
	new scr_text("A pink pastry stands in front of you.",[ #ffffff],[0],[0],[0]),
	new scr_text("You see bouquet of various red flowers",[ #ffffff],[0],[0],[0]),
	new scr_text("Trought the windows, you see various pastries and relics.",[ #ffffff],[0],[0],[0]),
	new scr_text("And bags of various fruits",[ #ffffff],[0],[0],[0]),
	new scr_text("Will you enter the shop?",[ #ffffff],[0],[0],[0])
]

// Autumn Cemetery
