import { ItemList } from './components/ItemList'
import { GroupList } from './components/GroupList'
import { data as store } from './store/data.imba'

global css @root
	* m:0 p:0
	ff:sans
	$primary:#2E3440

global css
	html, input ff:sans
	.clickable cursor:pointer
	.input border-style:hidden
	.spaced p:.2rem .4rem
	.button appearance:none bd:1px solid cool8 bg:none bg@hover:cool5
	.add w:25rem shadow:none bd:none bg:cool4 bg@hover:cool5 c:white my:.4rem py:.2rem
	.search w:25rem my:.4rem

tag App
	prop query_p = ''
	prop query_c = ''

	<self [w:80vw m:4rem auto d:flex jc:space-between]>
		<GroupList detail_title="Pendientes">
			<ItemList
				bind:search=query_p
				data=store
				select_to_add=no
				placeholder_search="Buscar pendientes"
			>
		<GroupList detail_title="Completados">
			<ItemList
				bind:search=query_c
				data=store
				select_to_add=yes
				placeholder_search="Buscar completados"
			>

imba.mount <App>
