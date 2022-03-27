let data = [
	{ id: 1, title: 'Item 1', done: no },
	{ id: 2, title: 'Item 2', done: no },
	{ id: 3, title: 'Item 3', done: yes },
	{ id: 4, title: 'Item 4', done: no },
	{ id: 5, title: 'Item 5', done: yes }
]

global css @root
	* m:0 p:0
	ff:sans
	--primary:#2E3440
	--red:#BF616A
	--green:#A3BE8C

global css
	html, input ff:sans

	.clickable cursor:pointer
	.input border-style:hidden
	.button appearance:none bd:1px solid cool8 bg:none bg@hover:cool5 p:.2rem .4rem
	.add w:25rem shadow:none bd:none bg:cool4 bg@hover:cool5 c:white my:.4rem py:.2rem

tag App
	prop query_p = ''
	prop query_c = ''

	def add_item criteria
		data.push({ id: Math.random!, title: 'Nuevo Item', done: criteria })

	def delete_item item
		data = data.filter do(it) it.id isnt item.id

	def match_pendant_search title
		!query_p or title.toLowerCase!.indexOf(query_p) > -1

	def match_completed_search title
		!query_c or title.toLowerCase!.indexOf(query_c) > -1

	<self [w:80vw m:4rem auto d:flex jc:space-between]>
		<fieldset [w:26rem p:1rem rd:.2rem border-color:var(--primary)]>
			<legend [ta:center px:.4rem bdl:2px solid var(--primary) bdr:2px solid var(--primary)]> "Pendientes"
			<input.clickable.input placeholder="Buscar pendientes" [p:.2rem .4rem w:25rem my:.4rem] bind=query_p>
			for item in data
				continue if !match_pendant_search(item.title)
				if !item.done
					<div [d:flex ai:center jc:space-between w:25rem my:.4rem]>
						<div [min-width:10rem]>
							<input.input.clickable [p:.2rem .4rem] size="45" type="text" bind=item.title>
						<div>
							<button.clickable.button @click=(item.done=yes) [c:var(--green)]> "✓"
							<button.clickable.button @click=delete_item(item) [c:purple9 fw:bold]> "🗑"
			<button.clickable.add @click=add_item(no)> "+"
		<fieldset [w:26rem p:1rem rd:.2rem border-color:var(--primary)]>
			<legend [ta:center px:.4rem bdl:2px solid var(--primary) bdr:2px solid var(--primary)]> "Completados"
			<input.clickable.input placeholder="Buscar completados" [p:.2rem .4rem w:25rem my:.4rem] bind=query_c>
			for item in data
				continue if !match_completed_search(item.title)
				if item.done
					<div [d:flex ai:center jc:space-between w:25rem my:.4rem]>
						<div [min-width:10rem]>
							<input.input.clickable [p:.2rem .4rem] size="45" type="text" bind=item.title>
						<div>
							<button.clickable.button @click=(item.done=no) [c:var(--red)]> "✕"
							<button.clickable.button @click=delete_item(item) [c:purple9 fw:bold]> "🗑"
			<button.clickable.add @click=add_item(yes)> "+"

imba.mount <App>
