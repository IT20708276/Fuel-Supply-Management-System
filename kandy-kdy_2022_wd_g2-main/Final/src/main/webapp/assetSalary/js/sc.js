const date = document.getElementById('date');
const form = document.getElementById('form');
const errorElement = document.getElementById('error')
form.addEventListener('submit', (e) =>{
	let messages = []
	if (date.value == '' || date.value == null){
		messages.push('DATE IS REQUIRED')
	}
	if(messages.length > 0){
	e.preventDefault
	errorElement.innerText = messages.join(', ')
	}
	
})