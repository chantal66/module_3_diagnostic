class SearchController < ApplicationController
  def index
    # zipcode = params[:q].split(/\W+/)[-1]
    #
    # @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV["alt_fuel_key"]
    #   faraday.adapter Faraday.default_adapter
    # end
    #
    # response = @conn.get("nearest.json?location=#{zipcode}&fuel_type=ELEC,LPG&limit=10")
    # results = JSON.parse(response.body, symbolize_names: true)
    #
    # @fuel_stations = results[:fuel_stations].map do |result|
    #   FuelStation.new(result)
    # end
    # zipcode = params[:q].split(/\W+/)[-1]
    binding.pryq
    @fuel_stations = FuelStation.search_nearest_stations(params[:q])

  end
end