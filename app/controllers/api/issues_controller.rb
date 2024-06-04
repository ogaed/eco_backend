module Api
    class IssuesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_issue, only: [:show, :edit, :update, :destroy]
  
      def create
        puts current_user.id
        @issue = current_user.issues.new(issue_params)
        @issue.farm_specialist_id = find_farm_specialist_id # Set the farm specialist ID
    
  
        if @issue.save
          render json: IssueSerializer.new(@issue).serializable_hash, status: :ok
        else
          render json: { status: "error", message: "Failed to save Issue.", errors: @issue.errors }, status: :unprocessable_entity
        end
      end

      def index
        @issues = current_user.issues.all
        render json: IssueSerializer.new(@issues).serializable_hash
      end
      
      
  
      def show
        cutomer show all
        enum role: [:customer, :farmer, :farm_specialist, :admin]
      end
  
      def new
        @issue = Issue.new
      end
  
      def edit
      end
  
      # def update
      #   if @issue.update(issue_params)
      #     redirect_to @issue, notice: "Issue was successfully updated."
      #   else
      #     render :edit
      #   end
      # end

      def update
        # Check if the current user is a farm specialist and is associated with the issue
        if current_user.role == 'farm_specialist' && current_user.id == @issue.farm_specialist_id
          if @issue.update(issue_params)
            render json: IssueSerializer.new(@issue).serializable_hash, status: :ok
          else
            render json: { status: "error", message: "Failed to update Issue.", errors: @issue.errors }, status: :unprocessable_entity
          end
        else
          render json: { status: "error", message: "You are not authorized to update this issue." }, status: :unauthorized
        end
      end
  
      def destroy
        @issue.destroy
        redirect_to @issue, notice: "Issue was successfully destroyed."
      end
  
      private
  
      def set_issue
        @issue = Issue.find(params[:id])
      end
  
      def issue_params
        params.require(:issue).permit(:description, :issue_type, :status,  :crop_id, :user_id, :farm_specialist_id)
      end

      def find_farm_specialist_id
        # Find a random farm specialist and return their ID
        farm_specialist = User.where(role: :farm_specialist).order("RANDOM()").first
        farm_specialist&.id
      end
      
      
    end
  end