# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader' if development?
require 'northern_pike'

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
      NorthernPike.lat_lng_to_os_ref(lat: lat, lng: lng).to_json
    rescue StandardError => e
      halt(404, { message: e }.to_json)
    end
  end
end
