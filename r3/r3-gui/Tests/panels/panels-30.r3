REBOL [
	Title: "Panels example #30"
	Author: "Ladislav Mecir"
	Version: "$Id: $"
	Date: 11-Apr-2011/16:15:30+2:00
]

view/options [
	title "resize example"
	h: hpanel [
		a: box 200x200 red
	]
	button "resize" do [
		w: window-face? h
		old-init: w/facets/init-size
		a/facets/init-size/x: 119 + random 161
		update-face/no-show a
		do-style w 'on-update none
		do-style w 'on-resize w/facets/gob-size
			* w/facets/init-size / old-init
		draw-face w			
	]
][
	title: "Panels example #30"
]