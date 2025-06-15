# config/initializers/importmap.rb
Rails.application.config.importmap.draw do
  # Example of pinning a CDN asset:
  # pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"

  # Preload all JavaScript files under app/javascript
  # You can remove this if you prefer to only preload specific pins above.
  Dir.glob(Rails.root.join("app/javascript/**/*.js")).each do |file|
    path = file.sub(Rails.root.join("app/javascript/").to_s, "")
    pin path.remove(".js"), to: path, preload: true unless path.starts_with?("controllers/")
  end

  # For controllers, they are handled by pin_all_from in config/importmap.rb
end
