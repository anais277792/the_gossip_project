
  require 'bundler'
  Bundler.require
require 'gossips'

class ApplicationController < Sinatra::Base
   #envoyer à notre fichier ERB des variables que l'on utilisera => array obtenu par Gossip.all
  get '/' do 
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do 
     erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    redirect '/'
  end

 
  
end
