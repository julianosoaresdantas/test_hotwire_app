# config/importmap.rb

pin "application", preload: true
# REMOVE the old "pin "controllers", under: "controllers"" line
# ADD this correct line instead:
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
# ... other pins (if you have any more)
