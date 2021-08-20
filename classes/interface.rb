require_relative '../modules/interface/alerts'
require_relative '../modules/interface/requests'
require_relative '../modules/interface/information_output'

class Interface
  include Alerts
  include Requests
  include InformationOutput

  def initialize
    system 'clear'
  end
end
