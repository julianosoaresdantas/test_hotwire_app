// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import { Application } from "@hotwired/stimulus" // Import Stimulus Application
import { registerControllers } from "@hotwired/stimulus-loading" // Import helper for auto-registration

const application = Application.start() // Start the Stimulus application
registerControllers(application) // Register all controllers found via importmap

// Optional: Expose application globally if needed for debugging or advanced use
// window.Stimulus = application