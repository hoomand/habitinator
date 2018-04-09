# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( stylish-portfolio.js )
Rails.application.config.assets.precompile += %w( devise.css.scss )

# admin layout css and javascript
Rails.application.config.assets.precompile += %w( admin/layout/fontastic.css )
Rails.application.config.assets.precompile += %w( admin/layout/grasp_mobile_progress_circle-1.0.0.min.css )
Rails.application.config.assets.precompile += %w( admin/layout/jquery.mCustomScrollbar.css )
Rails.application.config.assets.precompile += %w( admin/layout/style.default.css )
Rails.application.config.assets.precompile += %w( admin/layout/style.css )
Rails.application.config.assets.precompile += %w( admin/layout/custom.css )
Rails.application.config.assets.precompile += %w( admin/goals.css )

Rails.application.config.assets.precompile += %w( admin/layout/grasp_mobile_progress_circle-1.0.0.min.js )
Rails.application.config.assets.precompile += %w( admin/layout/front.js )
Rails.application.config.assets.precompile += %w( admin/layout/jquery.cookie.js )
Rails.application.config.assets.precompile += %w( admin/layout/jquery.mCustomScrollbar.concat.min.js )
Rails.application.config.assets.precompile += %w( admin/layout/jquery.validate.min.js )
