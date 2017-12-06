module Api
  module V1
    class ResultsController < ApplicationController
      respond_to? :json
      
      def index
        render json: Result.all
      end

      def show
        respond_with Result.find(params[:id])
      end
      
      def create
        respond_with Result.create(result_params)
      end
      
      def update
        respond_with Result.update(result_params)
      end
      
      def destroy
        respond_with Result.destroy(params[:id])
      end

      private

      def result_params
      params.require(:result).permit(:emis, :centre_no, :name, :wrote_2014, :passed_2014, :wrote_2015, :passed_2015, :wrote_2016, :passed_2016)
    end
    end
  end
end
