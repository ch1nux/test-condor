import { add_item } from '../store/data.imba'

export tag AddItem
	prop criteria = no

	<self>
		<button.clickable.add @click=add_item(criteria)> "+"