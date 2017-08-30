class FuelStation

  attr_reader :name,
              :phone,
              :fuel_type,
              :distance,
              :access,
              :street_address,
              :city,
              :state

  def initialize(attr = {})
    @name           = attr[:station_name]
    @phone          = attr[:station_phone]
    @fuel_type      = attr[:fuel_type_code]
    @distance       = attr[:distance]
    @access         = attr[:access_days_time]
    @street_address = attr[:street_address]
    @city           = attr[:city]
    @state          = attr[:state]
  end

  def search_nearest_stations(zipcode)
    fuel_stations = FuelStationService.search_nearest_stations(zipcode).map do |station|
      FuelStation.new(station)
    end
  end
end
