require './utils'

module Utils::Service
  def self.current_service_name
    `echo -e "open\nget Setup:/Network/Service/#{current_service_guid}\nd.show" | scutil | awk -F': ' '/UserDefinedName/{print $2}'`.delete("\n")
  end

  def self.current_service_guid
    `echo -e "open\nget State:/Network/Global/IPv4\nd.show" | scutil | awk '/PrimaryService/{print $3}'`
  end
end
