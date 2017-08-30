class SearchController < ApplicationController
  def index
    zipcode = params[:q].split(/\W+/)[-1]

    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["alt_fuel_key"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("nearest.json?location=#{zipcode}")
    results = JSON.parse(response.body, symbolize_names: true)


  end
end