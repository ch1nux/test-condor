import { delete_item } from '../store/data.imba'

export tag Item
	prop key = 0
	prop title = ""
	prop done = no
	prop criteria = no

	<self [d:flex ai:center jc:space-between w:25rem my:.4rem]>
		<div [min-width:10rem]>
			<input.input.clickable.spaced 
				size="45" 
				type="text" 
				bind=title
			>
		<div>
			<button.clickable.button.spaced 
				@click=(done=!criteria)
				[c:{done ? "red6" : "green6"}]
			> done ? "✕" : "✓"
			<button.clickable.button.spaced 
				@click=delete_item(key) 
				[c:purple9 fw:bold]
			> "🗑"
