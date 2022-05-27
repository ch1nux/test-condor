import { Item } from './Item.imba'
import { AddItem } from './AddItem.imba'

export tag ItemList
	prop data = []
	prop placeholder_search
	prop search = ""
	prop select_to_add = no

	def match_search title, criteria
		!criteria or title.toLowerCase!.indexOf(criteria) > -1

	<self>
		<input.clickable.input.search.spaced 
			placeholder=placeholder_search
			bind=search
		>
		for item in data
			continue if !match_search(item.title, search)
			if item.done is select_to_add
				<Item
					bind:key=item.id
					bind:title=item.title
					bind:done=item.done
					criteria=select_to_add
				>
		<AddItem criteria=select_to_add>
