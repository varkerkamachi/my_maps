class MarkersController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def index
    @markers = Marker.of_map( params[:map_id] ) rescue []
  end

  def show
    @marker = find_record( params[:id] )
  end

  def new
    @marker = Marker.new
  end

  def create
    @marker = Marker.new(model_params)
    #model_params['user_id'] = current_user.id
    @marker.save!
    redirect_to action: :show, id: @marker
  end

  def edit
    @marker = find_record( params[:id] ) rescue nil
  end

  def update
    @marker = find_record( params[:id] ) rescue nil
    unless @marker.blank?
      @marker.update!(model_params)
    end
  end

  def destroy
    @marker = find_record( params[:id] )
    @marker.destroy!
  end

  private
  def find_record id
    Marker.find( id ) rescue nil
  end

  def model_params
    params.require(:marker).permit(:name, :map_id, :description, :marker_type, :resident_count)
  end
end
