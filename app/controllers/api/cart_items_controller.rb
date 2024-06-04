module Api
    class CartItemsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  
      def create
        puts current_user.id
        @cart_item = current_user.cart_items.new(cart_item_params)
  
        if @cart_item.save
          render json: CartItemSerializer.new(@cart_item).serializable_hash, status: :ok
        else
          render json: { status: "error", message: "Failed to save Cart item.", errors: @cart_item.errors }, status: :unprocessable_entity
        end
      end
  
      def index
        if current_user.role === "customer"
          @cart_item = current_user.cart_items.all
        else
          @cart_items = CartItem.all
        end
        render json: CartItemSerializer.new(@cart_items).serializable_hash
      end
  
      def show
        cutomer show all
        enum status: [:pending, :paid, :delivered]
      end
  
      def new
        @cart_item = CartItem.new
      end
  
      def edit
      end
  
      def update
        if @cart_item.update(product_params)
          redirect_to @cart_item, notice: "Cart Item was successfully updated."
        else
          render :edit
        end
      end
  
      def destroy
        @cart_item.destroy
        redirect_to @cart_item, notice: "Cart Item was successfully destroyed."
      end
  
      private
  
      def set_cart_item
        @cart_item = CartItem.find(params[:id])
      end
  
      def cart_item_params
        params.require(:cart_item).permit(:quantity, :total, :status, :product_id, :user_id, :crop_id)
      end
      
    end
  end
  