class MapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @maps = Map.of_user( current_user ) rescue []
  end

  def show
    @map = find_record( params[:id] )
  end

  def create
    @map = Map.new(model_params)
    model_params['user_id'] = current_user.id
    @map.save!
  end

  def update
    @map = find_record( params[:id] )
    @map.update!(model_params)
  end

  def destroy
    @map = find_record( params[:id] )
    @map.destroy!
  end

  private
  def find_record id
    Map.find( id ) rescue nil
  end

  def model_params
    params.permit(:name, :user_id, :description, :lat1, :lat2, :long1, :long2)
  end
end
