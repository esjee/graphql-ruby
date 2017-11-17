# frozen_string_literal: true

module GraphQL
  module Tracing
    module Scrubber
      class Variables
        def self.perform(variables = {}, blacklisted_variables = [])
          new.scrub(variables, blacklisted_variables)
        end

        def scrub(variables, blacklisted_variables)
          variables.each_with_object({}).each do |(key, value), obj|
            obj[key] = blacklisted_variables.include?(key) ? scrub_value : value
          end
        end

        private

        def scrub_value
          '*****'
        end
      end
    end
  end
end
