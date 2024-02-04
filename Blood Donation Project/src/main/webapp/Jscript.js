
var welcome_page = document.getElementById("welcomepage")
var register_page = document.getElementById("registerpage")
var register_button = document.getElementById("add-popup-button-1")
var close_button = document.getElementById("cancel-popup")

register_button.addEventListener("click", function(event) {
	event.preventDefault()
	register_page.style.display = "block"
})
close_button.addEventListener("click", function(event) {
	event.preventDefault()
	register_page.style.display = "none"
})
