require 'dradis/plugins/brakeman/engine'
require 'dradis/plugins/brakeman/version'

module Dradis
  module Plugins
    module Brakeman
      # Connect to the framework
      include Dradis::Core::Plugins::Base

      # These are provided by the above Plugins::Base
      self.plugin_name= 'Brakeman upload'
      provides :upload
    end
  end
end