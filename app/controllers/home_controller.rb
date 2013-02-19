class HomeController < ApplicationController
  def index
    logit(params)
    @payloads = Payload.order("created_at DESC").limit(100)
  end

  def create
    #curl --data "payload=bomtastic&ninja=salad&pirate=smiles" http://localhost:3000/home
    #curl --data "payload=funtimes&company=webascender&dev=ryan.doom" http://iha-generic-logger.herokuapp.com/home
    render :text => logit(params)    
  end

  def logit(params)
    params.delete(:action)
    params.delete(:controller)
    if params.keys.count > 0
      Payload.create!(:params => params.to_yaml)
    end
    return params
  end
end
