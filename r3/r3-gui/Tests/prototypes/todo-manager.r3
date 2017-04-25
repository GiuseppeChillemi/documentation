rebol []

todo-data: [
]

if exists? %todo-data.dat [
	todo-data: load/all %todo-data.dat
]

do-command: funct [command][
	? command
	whitespace: " "

	; parse variables
	time: text: none

	parse command [
		"a" whitespace [copy text to ":" copy time to end | copy text to end] (
			insert/only todo-data reduce ["-" text to-string now]
			update-face todo-list
		)
		| "f" whitespace copy text to end (
			set-facet todo-list 'filter compose [row/2 = (text)]
			; probe compose [row/2 = (text)]
			update-face todo-list
		)
	]
]

todo-ctx: context [
	lay: [
		hpanel [
			label "CLI"
			field do [do-command value] on-key [do [do-command join "f " value]]
		]
		todo-list: text-table ["State" "Item" "Touched"] todo-data
	]

	init: does [
		view lay
	]
]

todo-ctx/init

save/all %todo-data.dat todo-data
halt