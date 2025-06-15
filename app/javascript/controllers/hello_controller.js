// app/javascript/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello from Stimulus! (Updated)"); // This is the line we're looking for
  }

  // You might have a greet() method or other methods here
  greet() {
    console.log("Greeting from hello_controller! (New Message)");
  }
}