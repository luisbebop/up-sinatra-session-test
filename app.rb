#!/usr/bin/env ruby

require 'sinatra'

enable :sessions

set :session_secret, ENV.fetch('SESSION_SECRET')

get '/' do
  if session['name']
    @name = session['name']
    erb :name
  else
    erb :index
  end
end

post '/' do
  session['name'] = params['name']
  redirect to('/development')
end

get '/reset' do
  session['name'] = nil
  redirect to('/development')
end