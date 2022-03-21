require 'ostruct'

class WrongProviderError < StandardError; end
class MissingProvidersError < StandardError; end
class MultipleProvidersError < StandardError; end

# Returns a Provider based on the order's U.S state abbreviation.
# See the main_spec.rb file for for examples.
#
# Raises one of the above errors if the set of input or output Providers
# is invalid.
#
# Expected object attributes:
#     order.us_state_abbr => 'WA'
#     provider.name => 'Road-Tec'
#
# @param order [OpenStruct] an order object
# @param providers [Array<OpenStruct>] an array of 0 or more Provider objects
# @return OpenStruct provider
def provider_by_state(order:, providers:)
  ## Write your code here...
end
