class HomeController < ApplicationController
  def index
    @payloads = Payload.order("created_at DESC").limit(100)
  end

  def create
    output =  params 
    output.delete(:action)
    output.delete(:controller)
    Payload.create!(:params => output.to_yaml)
    render :text => output
  end
end
