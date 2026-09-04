global.cutscenes = {};

global.cutscenes[$ "test"] = 
[
	new scr_text("Texttest",[ #ffffff,#ffffff],[4,1],[1,6],[4,9],[0.05,0.1],[60,120],[1,5],[4,8]),
	new scr_speaker(spr_textbox_flower,spr_flower_portrait_neutral_a,PORTRAIT_SIDE.LEFT),
	new scr_text("@flower@Flower test",[ #FFF200],[0],[9],[14],[1],[0],[0],[0])
]

global.cutscenes[$ "door"] = 
[
	new scr_text("It's a locked door.",[ #ffffff],[0],[0],[0],[1],[0],[0],[0])
]

global.cutscenes[$ "tomb"] = 
[
	new scr_text("It's the tomb of a deceased Monster.",[ #ffffff],[0],[0],[0],[1],[0],[0],[0])
]

//Scarlet Fields

global.cutscenes[$ "scarlet teapot"] = 
[
	new scr_text("Teapots...",[ #CC9F4F],[1],[1],[10],[1],[0],[0],[0]),
	new scr_text("Meant for two lovers.",[ #ffffff],[0],[0],[0],[1],[0],[0],[0]),
	new scr_speaker(spr_textbox_flower, spr_flower_portrait_neutral_a, PORTRAIT_SIDE.LEFT),
	new scr_text("Wish i'd ride one someday.",[ #CC9F4F],[1],[15],[17],[1],[0],[0],[0])
]

global.cutscenes[$ "rouge pastry"] = 
[
	new scr_text("A pink pastry stands in front of you.",[ #ffffff],[0],[0],[0],[1],[0],[0],[0]),
	new scr_text("You see bouquet of various red flowers",[ #ffffff],[0],[0],[0],[1],[0],[0],[0]),
	new scr_text("Trought the windows, you see various pastries and relics.",[ #ffffff],[0],[0],[0],[1],[0],[0],[0]),
	new scr_text("And bags of various fruits",[ #ffffff],[0],[0],[0],[1],[0],[0],[0]),
	new scr_text("Will you enter the shop?",[ #ffffff],[0],[0],[0],[1],[0],[0],[0])
]

// Autumn Cemetery
