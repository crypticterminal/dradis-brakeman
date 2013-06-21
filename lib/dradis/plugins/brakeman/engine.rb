require 'dradis_core'

module Dradis
  module Plugins
    module Brakeman
      class Engine < ::Rails::Engine
        isolate_namespace Dradis::Plugins::Brakeman
        engine_name 'dradis_brakeman'

        # use rspec for tests
        config.generators do |g|
          g.test_framework :rspec
        end
      end
    end
  end
end