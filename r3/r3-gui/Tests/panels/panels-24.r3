REBOL [
	Title: "Panels example #24"
	Author: "Richard Smolak"
	Version: "$Id: resizing-new-1.r3 852 2010-10-07 13:28:26Z cyphre $"
]

update-btn: func [
	btn [object!]
	id [integer!]
][
	id: pick [visible hidden ignored fixed] id	
	if id = 'fixed [
		btn/gob/offset: random 100x100
	]
	show-face btn id
]

view/options [
	title "SHOW modes test example"
	hpanel 3 [
		b1: button "one"
		b2: button "two"
		b3: button "three"
		b4: button "four"
		b5: button "five"
		b6: button "six"
	]
	hgroup [
		drop-down ["visible" "hidden" "ignored" "fixed"] do [update-btn b1 value]
		drop-down ["visible" "hidden" "ignored" "fixed"] do [update-btn b2 value]
		drop-down ["visible" "hidden" "ignored" "fixed"] do [update-btn b3 value]
		return
		drop-down ["visible" "hidden" "ignored" "fixed"] do [update-btn b4 value]
		drop-down ["visible" "hidden" "ignored" "fixed"] do [update-btn b5 value]
		drop-down ["visible" "hidden" "ignored" "fixed"] do [update-btn b6 value]
	]
][
	title: "Panels example #24"
]

