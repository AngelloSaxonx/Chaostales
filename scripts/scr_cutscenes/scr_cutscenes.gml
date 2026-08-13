global.cutscenes = {};

global.cutscenes[$ "test"] = 
[
	new scr_text("Text testing"),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral, PORTRAIT_SIDE.LEFT),
	new scr_text("Floriel left testing."),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral, PORTRAIT_SIDE.RIGHT),
	new scr_text("Floriel right testing")
]

global.cutscenes[$ "door"] = 
[
	new scr_text("It's a locked door.")
]

global.cutscenes[$ "tomb"] = 
[
	new scr_text("It's the tomb of a deceased Monster.")
]

//Scarlet Fields

global.cutscenes[$ "scarlet teapot"] = 
[
	new scr_text("Teapots..."),
	new scr_text("Meant for two lovers."),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral, PORTRAIT_SIDE.LEFT),
	new scr_text("Wish i'd ride one someday.")
]

global.cutscenes[$ "rouge pastry"] = 
[
	new scr_text("A pink pastry stands in front of you."),
	new scr_text("You see bouquet of various red flowers"),
	new scr_text("Trought the windows, you see various pastries and relics."),
	new scr_text("And bags of various fruits"),
	new scr_text("Will you enter the shop?")
]

// Autumn Cemetery

