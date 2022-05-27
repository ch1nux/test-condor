let data = [
	{ id: 1, title: 'Item 1', done: no },
	{ id: 2, title: 'Item 2', done: no },
	{ id: 3, title: 'Item 3', done: yes },
	{ id: 4, title: 'Item 4', done: no },
	{ id: 5, title: 'Item 5', done: yes }
]

def add_item criteria
	data.push({ id: Math.random!, title: 'Nuevo Item', done: criteria })

def delete_item id
	data = data.filter do(it) it.id isnt id

export {
	data
	add_item
	delete_item
}