REBOL [
	Title: "Do all panel tests"
	Author: "Ladislav Mecir"
	Version: "$Id: $"
]

repeat i 36 [
	file: rejoin [%panels- i %.r3]
	print file
	do file
]
