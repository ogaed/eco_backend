module Api
    class ProductsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_product, only: [:show, :edit, :update, :destroy]
  
      def create
        puts current_user.id
        @product = current_user.products.new(product_params)
  
        if @product.save
          render json: ProductSerializer.new(@product).serializable_hash, status: :ok
        else
          render json: { status: "error", message: "Failed to save Product.", errors: @product.errors }, status: :unprocessable_entity
        end
      end
  
      def index
        if current_user.role === "farmer"
          @products = current_user.products.all
        else
          @products = Product.all
        end
        render json: ProductSerializer.new(@products).serializable_hash
      end
  
      def show
        cutomer show all
        enum role: [:customer, :farmer, :farm_specialist, :admin]
      end
  
      def new
        @product = Product.new
      end
  
      def edit
      end
  
      def update
        if @product.update(product_params)
          redirect_to @product, notice: "Product was successfully updated."
        else
          render :edit
        end
      end
  
      def destroy
        @product.destroy
        redirect_to @product, notice: "Product was successfully destroyed."
      end
  
      private
  
      def set_product
        @product = Product.find(params[:id])
      end
  
      def product_params
        params.require(:product).permit(:name, :description, :price, :quantity,:user_id, :crop_id)
      end
    end
  end
  