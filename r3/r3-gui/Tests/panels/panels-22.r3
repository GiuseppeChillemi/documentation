REBOL [
	Title: "Panels example #22"
	Author: "Richard Smolak"
	Version: "$Id: resizing-new-1.r3 852 2010-10-07 13:28:26Z cyphre $"
]

view [
	vgroup [
		hgroup [
			button "1"
			button "2"
			button "3"
		]

		vgroup [
			button "1"
			button "2"
			button "3"
		]
		
		return
		
		hgroup [
			button "1"
			button "2"
			return
			button "3"
		]

		vgroup [
			button "1"
			button "2"
			return
			button "3"
		]
	]
]