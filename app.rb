# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader' if development?
require 'northern_pike'

os_maps = JSON.parse(File.read(Dir.pwd + '/os-maps.json'))

def point_in_bounding_box(p, bb)
  (bb[0]['lat'] <= p[:lat] && p[:lat] <= bb[1]['lat'] && bb[0]['lng'] <= p[:lng] && p[:lng] <= bb[1]['lng'])
end


namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/os-ref/:ref' do |ref|
    begin
      NorthernPike.os_ref_to_lat_lng(os_ref: ref).to_json
    rescue StandardError => e
      halt(404, { message: e }.to_json)
    end
  end

  get '/lat/:lat/lng/:lng' do |lat, lng|
    begin
      os_ref = NorthernPike.lat_lng_to_os_ref(lat: lat, lng: lng)[:os_map_ref]
      map = os_maps.find {|map| point_in_bounding_box({lat: lat.to_f, lng: lng.to_f}, map['bounding_box']) }
      {
        os_ref: os_ref,
        os_map: map
      }.to_json
      
    rescue StandardError => e
      halt(404, { message: e }.to_json)
    end
  end
end
