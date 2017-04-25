Rebol []

view [
	field do [print ["do-command" value]] on-key [do [probe type? actor-arg]]
]
