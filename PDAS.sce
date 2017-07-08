scenario = "PDAS";
scenario_type = fMRI_emulation;
#scenario_type = fMRI;
scan_period = 2000;
response_matching = simple_matching;
no_logfile = false;
sequence_interrupt=false; #default
active_buttons = 2;
button_codes=0,1;
default_font="arial";
default_font_size=30;
default_text_color=255,255,255;
default_background_color=0,0,0;

begin;

# building the PD game

text { caption = 
"Y
o
u
r

c
h
o
i
c
e"; font_size=15;} yours; 
text { caption = "Your partner's choice"; font_size=15;} partner;
text { caption = "Cooperate"; font_size=12;} cooperate;
text { caption = "Default"; font_size=12;} nocoop;
text { caption = 
"C
o
o
p
e
r
a
t
e"; font_size=12;} yourcoop;
text { caption =
"D
e
f
a
u
l
t"; font_size=12;} yournocoop;
text { caption = "¥ 70"; font_size=20;} yen_1;
text { caption = "¥ 100"; font_size=20;} yen_2;
text { caption = "¥ 140"; font_size=20;} yen_3;
text { caption = "¥ 170"; font_size=20;} yen_4;

line_graphic { 
coordinates = -240, -200, -240, 240;
coordinates = -240, 240, 200, 240;
coordinates = 200, 240, 200, -200;
coordinates = -240, -200, 200, -200;
coordinates = -200, -200, -200, 200;
coordinates = -200, 200, 200, 200;
coordinates = -240, 240, 200, -200;
coordinates = 0, 200, 200, 0;
coordinates = -200, 0, 0, -200;
coordinates = -240, 0, 200, 0;
coordinates = 0, 240, 0, -200;
line_width = 2;
} line;

picture { text { caption = "+"; }; x=0; y=0; } fix;
picture { text { caption = "
You are now playing
the PRISONER'S DILEMMA
APPROVAL STAGE game 
with your partner"; }; x=0; y=0; } cue;
picture { 
text yours; x=-260; y=0; 
text partner; x=0; y=260;
line_graphic line; x=0; y=0;
text cooperate; x=-130; y=220;
text nocoop; x=70; y=220;
text yourcoop; x=-220; y=100;
text yournocoop; x=-220; y=-100;
text yen_3; x=-150; y=50;
text yen_3; x=-50; y=150;
text yen_1; x=50; y=50;
text yen_4; x=150; y=150;
text yen_1; x=-50; y=-50;
text yen_4; x=-150; y=-150;
text yen_2; x=150; y=-50;
text yen_2; x=50; y=-150;
} pd;
picture { text { caption = "Do you cooperate or default?"; }; x=0; y=0; } coop;
picture { text { caption = "Wait"; }; x=0; y=0; } wait;
picture { text { caption = "Your partner chose to cooperate"; }; x=0; y=0; } chose;
picture { text { caption = "Do you aprove or disaprove?"; }; x=0; y=0; } aprove;
picture { text { caption = "Your partner chose to aprove"; }; x=0; y=0; } feed;

trial { picture fix; duration = 4000; code= "fix";} fixing;
trial { picture cue; duration = 4000; code= "cue";} cuing;
trial { picture pd; duration = 16000; code= "PD";}PD;
trial { picture coop; duration = 4000; code= "coop";} cooping;
trial { picture wait; duration = 4000; code= "wait";} waiting;
trial { picture chose; duration = 4000; code= "chose";} choosing;
trial { picture aprove; duration = 4000; code= "aprove";} aproving;
trial { picture feed; duration = 4000; code= "feed";} feeding;


begin_pcl;

# Sequence for delivery of stimuli

fixing.present(); cuing.present(); PD.present();
cooping.present(); waiting.present(); choosing.present();
aproving.present(); feeding.present();
