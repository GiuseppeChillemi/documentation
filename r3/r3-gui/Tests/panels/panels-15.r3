REBOL [
	Title: "Panels example #15"
	Author: "Ladislav Mecir Richard Smolak"
	Version: "$Id: panels-15.r3 2311 2011-04-08 11:51:47Z cyphre $"
]

;---- Tests

view/options [
    title "Opinion Survey"
    text "Do you want programs to be easy to build?"
    p: hpanel 2 [
        label "Answer:"
        hgroup [
            radio "Agree" #"a"
            radio "Disagree" #"d"
            radio "Not sure" #"n"
        ] options [min-hint: 'init max-hint: 'init]
        pad
        check "I'm a programmer." #"p"
        pad
        check "I am also a REBOL expert." #"e"
        label #"m" "Name:" options [access-face: 'fld]		;access-face redirects the 'access key' action to other face
        fld: field
        label #"o" "Comment:" options [access-face: 'ar] 
        ar: area
    ] options [row-max: [25 min min max max] column-max: [init max] box-model: 'frame]
    hgroup [
        button "Submit" submit http://www.rebol.net/cgi/submit.r
        button #"r" "Reset" reset 'p
        button "Cancel" close
    ]
][
	title: "Panels example #15"
	;access-keys are ctrl+shift+<key> actions that can be used as shortcuts for any face in the layout
	access-keys: [	;used for remapping of the default access keys
		#"r" #"a"	;this means default key #"r" will be mapped to ctrl+shift+g keypress
	]
	;shortcut-keys are user defined keyboard actions
	shortcut-keys: [
		#"^[" [unview halt]
		#"^Q" [
			print ["shortcut test" mold arg/flags]
		]
	]
]