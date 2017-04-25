REBOL [
	Title: "Panels example #23"
	Author: "Richard Smolak"
	Version: "$Id: resizing-new-1.r3 852 2010-10-07 13:28:26Z cyphre $"
]

stylize [
	wide-button: button [
		facets: [
			max-size: as-pair guie/max-coord 24
		]
	]
]

view [
	 vpanel [
		area
		hgroup [
			wide-button
			f: field
			return
			drop-down check
		]
		p: hpanel [
			button toggle button
		]

		b: wide-button "resize field" do [
			f/facets/init-size/x: 50 + random 100
			update-face f
		]
		wide-button "resize panel" do [
			p/facets/init-hint: reduce [200 + random 400 'auto]
			update-face/contents p
		]
	] options [
		column-max: 'min
	]
]