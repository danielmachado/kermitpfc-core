#settings.rb
require 'settingslogic'

# @author Daniel Machado Fernandez
# @version 1.0
# Implements the SettingsLogic gem Class to load the properties defined in the config.yml file
class Logging::Settings < Settingslogic

  source "config/config.yml"

end