require 'sinatra/base'
require 'pg'
require './lib/peeps'


class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peeps.create(newpeep: params[:newpeep])
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
