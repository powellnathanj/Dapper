require 'compass'
  # If you have any compass plugins, require them here.

  # This goes fucky
  #Compass.configuration.parse(File.join(RAILS_ROOT, "config", "compass.rb"))
  # Do this instead
  Compass.add_project_configuration(File.join(RAILS_ROOT, "config", "compass.rb"))
  
  Compass.configuration.environment = (defined?(Rails) ? Rails.env : RAILS_ENV).to_sym
  Compass.configure_sass_plugin!
  
