REBOL [
	Title: "Panels example #10"
	Author: "Ladislav Mecir"
	Version: "$Id: panels-10.r3 1959 2011-03-03 18:38:34Z cyphre $"
]

;---- Tests

view [
    hpanel 4 [
        button "First"
        button "Second"
        button "Third"
        button "Fourth"
        button "Fifth"
        button "Sixth"
    ]
]
