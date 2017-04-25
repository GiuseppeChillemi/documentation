REBOL[
	Title: "SCRUM Tool"
]

scrum-ctx: context [
	db: [
		projects [
			[PROJECT_ID NAME]
			1 "SCRUM Tool"
			2 "R3 GUI"
		]
		products [
			[PRODUCT_ID PROJECT_ID NAME]
			1 1 "A"
			2 1 "B"
			3 1 "C"
			4 1 "D"
			5 2 "styles"
			6 2 "layout"
			7 2 "facets"
		]
		sprints [
			[SPRINT_ID PROJECT_ID NAME]
			1 1 "#1"
			2 1 "#2"
			3 1 "#3"
			4 2 "week #1"
			5 2 "week #2"
			6 2 "week #3"
		]
		bugs [
			[BUG_ID PROJECT_ID NAME]
			1 1 "doesn't work"
			2 1 "looks ugly"
			3 1 "crashes instantly"
			4 2 "window doesn't open"
			5 2 "layout is slow"
			6 2 "styles look ugly"
		]
	]

	project-id: project-names: item-names: none

	table-projects: table-backlogs: table-items: none
	
	db-select: funct [
		table [block!]
		names [block!]
		/where
			cond [block!]
	][
		out: copy []
		foreach (table/1) next table compose/deep [
			if all [(any [cond true])] [
				append out reduce [(names)]
			]
		]
		out
	]

	set-project: func [
		id [integer!]
	][
		project-id: id
		set-backlog none
	]

	set-backlog: func [
		type [integer! none!]
	][
		item-names:	switch any [type all [table-backlogs get-face table-backlogs] 1][
			1	[db-select/where db/products [name] [project_id = project-id]]
			2	[db-select/where db/sprints [name] [project_id = project-id]]
			3	[db-select/where db/bugs [name] [project_id = project-id]]
		]

		if table-items [set-face/list table-items [data [item-names]]]
	]

	get-project-names: does [
		db-select db/projects [name]
	]

	lay: [
		field
		hpanel [
			table-projects: text-table ["Projects" project-names] do [
				scrum-ctx/set-project value
			]
			table-backlogs: text-table ["Backlogs" ["Product" "Sprint" "Bugs"]] do [
				set-backlog value
			]
			table-items: text-table ["Items" item-names]
		]
		tab-box [
			"Desc" []
			"Chat" []
		]
	]
	
	init: does [
		project-names: get-project-names
		set-project 1
		view lay
	]
]

scrum-ctx/init


