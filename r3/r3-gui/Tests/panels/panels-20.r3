REBOL [
	Title: "Panels example #20"
	Author: "Richard Smolak"
	Version: "$Id: resizing-new-1.r3 852 2010-10-07 13:28:26Z cyphre $"
]

stylize [

	tbox: hpanel [

		about: "Simple rectangular box."

		facets: [
			init-hint: 200x200
			min-hint: 0x0
			max-hint: guie/max-pair
			break-after: 1
		]

		options: [
			init-hint: [pair!]
		]
		
		actors: [
			on-make: [
				append face/options [
					content: [
						button "hello" do [print "hello"]
						button "world" do [print "hello"]
					]
				]
				do-style/style face 'on-make none 'hpanel
			]
		]
		
		draw: [
			pen red
			fill-pen blue
			box 0x0 (viewport-box/bottom-right - 1)
		]
	]
]


view [
	test: tbox
	button "clear"
		do [
			clear-panel-content test
		]	
	button "set"
		do [
			set-panel-content test [
				button "test"
				field "the best"
			]
		]	
	button "insert"
		do [
			insert-panel-content test bind/set probe reduce [to-set-word copy/part random "abcdefghijklmn" 2 'button join "button #" 1 + length? test/gob] 'system
		]
	button "append"
		do [
			append-panel-content test reduce ['button join "button #" 1 + length? test/gob]
		]	
	button "remove 2 faces at pos 3"
		do [
			remove-panel-content/pos/part test 3 2
		]
]
