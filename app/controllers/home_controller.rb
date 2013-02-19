class HomeController < ApplicationController
  def index
    @payloads = Payload.order("created_at DESC").limit(100)
  end

  def create
    #curl --data "payload=bomtastic&ninja=salad&pirate=smiles" http://localhost:3000/home
    output =  params 
    output.delete(:action)
    output.delete(:controller)
    Payload.create!(:params => output.to_yaml)
    render :text => output
  end
end
