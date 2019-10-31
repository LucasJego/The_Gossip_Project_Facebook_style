class CitiesController < ApplicationController

def show

@cities = City.find(params[:id])
@user = User.all

@gossip = Gossip.find(params[:id])
end 


end
