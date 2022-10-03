class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
       render json: Camper.all
    end

    def show
        render json: Camper.find(params[:id]), serializer: CamperActivitiesSerializer
    end

    def create
        camper =  Camper.create!(camper_params)
      
        render json: camper, status: :created
    end

    private

    def render_not_found_response
      render json: { error: "Camper not found" }, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    def render_unprocessable_entity_response(exception)
        render json: {  "errors": ["validation errors"]}, status: :unprocessable_entity
      end

end
