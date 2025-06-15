import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "content" ] // 1. Declare a target to reference HTML elements

  connect() {
    console.log("Toggle controller connected!")
    // You can set initial state here if needed
  }

  toggle() { // 2. This method will be called when an action is triggered
    this.contentTarget.classList.toggle("hidden") // 3. Toggle a CSS class
  }
}