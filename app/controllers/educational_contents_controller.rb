class EducationalContentsController < ApplicationController
    def index
        @educational_contents = EducationalContent.all
        render json: @educational_contents
      end
    
      def create
        @educational_content = EducationalContent.new(educational_content_params)
        if @educational_content.save
          render json: @educational_content, status: :created
        else
          render json: @educational_content.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def educational_content_params
        params.require(:educational_content).permit(:title, :content)
      end
end
