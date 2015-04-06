Rails.application.config.assets.paths << Rails.
    root.join('vendor', 'assets', 'images')

Rails.application.config.assets.precompile << ['application.js', 'vendor.js']
Rails.application.config.assets.precompile << ['application.css', 'vendor.css']