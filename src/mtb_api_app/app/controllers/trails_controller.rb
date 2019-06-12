class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  # GET /trails
  def index
    render json: { data: Trail.all }, status: 200
  end

  # GET /trails/1
  def show
    weather = @trail.weather
    trail = @trail
    render json:  { 
                    data: @trail,
                    weather: weather, 
                    hours_of_rain_since_midnight: @trail.hours_of_rain_since_midnight(weather),
                    rain_probabilities_since_midnight: @trail.rain_probabilities_since_midnight(weather),
                    sections: Section.where(trail_id:@trail).pluck(:name)
                    
                  }, status: 200
  end

  # GET /trails/new
  def new
    @trail = Trail.new
  end

  # GET /trails/1/edit
  def edit
  end

  # POST /trails
  def create
    trail = Trail.new(trail_params)
    trail.save
   
    render json: { data: trail }, status: 201
  end

  # PATCH/PUT /trails/1
  def update
    if @trail.update(trail_params)
      redirect_to @trail, notice: 'Trail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trails/1
  def destroy
    @trail.destroy
    render json: { }, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail
      @trail = Trail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trail_params
      params.require(:trail).permit(:name, :pic_url, :lat, :lon, :light_rain_wait, :heavy_rain_wait, :user_id)
    end
end
