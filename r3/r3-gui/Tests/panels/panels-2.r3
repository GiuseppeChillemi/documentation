REBOL [
	Title: "Panels example #2"
	Author: "Ladislav Mecir"
	Version: "$Id: panels-2.r3 1959 2011-03-03 18:38:34Z cyphre $"
]

;---- Tests

view [
    vpanel [
        text "Show website"
        button "Show" browse http://www.rebol.com
    ]
    vpanel [
        text "Example window."
        button "Close" close
    ]
]