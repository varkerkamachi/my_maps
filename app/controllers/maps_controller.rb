class MapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @maps = Map.of_user( current_user ) rescue []
  end

  def show
    @map = find_record( params[:id] )
    @markers = Marker.of_map(@map).to_json
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(model_params)
    #model_params['user_id'] = current_user.id
    @map.save!
    redirect_to action: :show, id: @map
  end

  def edit
    @map = find_record( params[:id] ) rescue nil
  end

  def update
    @map = find_record( params[:id] ) rescue nil
    unless @map.blank?
      @map.update!(model_params)
    end
    redirect_to action: :show, id: @map
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
    params.require(:map).permit(:name, :user_id, :description, :lat1, :lat2, :long1, :long2)
  end
end
