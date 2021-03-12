
require 'net/http'
require 'json'
require_relative "../../../config/environment"



class API
    URL = "https://kitsu.io/api/edge/"
    def self.get_actors
        uri = URI.parse(URL + "people")
        response = Net::HTTP.get_response(uri)
        json = JSON.parse(response.body)
        json["data"].each do |actor|
            name = actor["attributes"]["name"]
            Actor.find_or_create_by(name: name, years_active: rand(20))
        end
    end


    def self.get_shows
        uri = URI.parse(URL + "anime")
        response = Net::HTTP.get_response(uri)
        json = JSON.parse(response.body)
        json["data"].each do |show|
            title = show["attributes"]["canonicalTitle"]
            Show.find_or_create_by(title: title, year_aired: rand(1985..2020))
        end
    end
end


API.get_actors
API.get_shows