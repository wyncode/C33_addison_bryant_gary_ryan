class SectionsController < ApplicationController
    before_action :set_section, only: [:show, :edit, :update, :destroy]
  
    # GET /sections
    def index
      render json: { data: Section.all }, status: 200
    end
  
    # GET /sections/1
    def show
      render json: { data: @section }, status: 200
    end
  
    # GET /sections/new
    def new
      @section = Section.new
    end
  
    # GET /sections/1/edit
    def edit
    end
  
    # POST /sections
    def create
      section = Section.new(section_params)
      section.save
     
      render json: { data: section }, status: 201
    end
  
    # PATCH/PUT /sections/1
    def update
      if @section.update(section_params)
        redirect_to @section, notice: 'Section was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /sections/1
    def destroy
      @section.destroy
      render json: { }, status: 200
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_section
        @section = Section.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def section_params
        params.require(:section).permit(:name, :lat, :lon, :light_rain_wait, :heavy_rain_wait, :user_id)
      end
  end
  