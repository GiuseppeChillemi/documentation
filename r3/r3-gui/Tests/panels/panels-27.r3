REBOL [
	Title: "Panels example #27"
	Author: "Richard Smolak Pekr"
]

;---- Tests
lay: [
	backdrop [
		when [load] do [print "Load trigger!"]
		button "Do" alert "Button pressed!"
		button "Big Quit Button" maroon options [max-size: 2000x50] quit
		bar
		text "Toggle button..."
		t1: toggle "Toggle" of 'tog
		button "Set above Toggle False" set 't1 false
		button "Set above Toggle True"  set 't1 true
		toggle "Toggle Mirror" attach 't1
		toggle "Mutex with Toggle" of 'tog
		bar
		text "Radios and check boxes"
		radio "Set above Toggle on"  set 't1 true
		radio "Set above Toggle off" set 't1 false
		bar
		check "Checkbox attached to above toggle" attach 't1
	]
]

okno: make-face 'window reduce/no-set [content: lay]
view okno