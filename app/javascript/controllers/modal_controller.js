// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["content"] // Defines a target to manipulate (the modal content area)

  connect() {
    console.log("Modal controller connected")
    // Add a class to the body to prevent scrolling when modal is open
    document.body.classList.add("overflow-hidden")
    // Focus the modal content for accessibility
    this.contentTarget.focus()
  }

  disconnect() {
    console.log("Modal controller disconnected")
    // Remove the class from the body when modal is closed
    document.body.classList.remove("overflow-hidden")
  }

  // Action to close the modal
  close(event) {
    event.preventDefault() // Prevent default behavior for links/buttons
    this.element.remove() // Remove the entire modal from the DOM
  }

  // Action to close the modal if clicking outside the content area
  closeBackground(event) {
    if (event.target === this.element) { // Check if the click was on the overlay itself
      this.close(event)
    }
  }

  // Action to close the modal if Escape key is pressed
  closeWithKeyboard(event) {
    if (event.key === "Escape") {
      this.close(event)
    }
  }
}