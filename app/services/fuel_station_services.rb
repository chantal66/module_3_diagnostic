class FuelStationService

  def initialize(zipcode)
    @zipcode = zipcode

    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["alt_fuel_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def search_nearest_station(zipcode)
    response = @conn.get("nearest.json?location=#{zipcode}&fuel_type=ELEC,LPG&limit=10")
    results = JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_nearest_station
    new(zipcode).search_nearest_station
  end
end