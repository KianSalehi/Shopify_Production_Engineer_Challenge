class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(params.require(:product).permit(:title, :description, :quantity, :weight, :city))
            flash[:notice] = "Product was updated successfully."
            redirect_to @product
        else
            render 'edit'
        end
    end

    def create
        @product = Product.new(params.require(:product).permit(:title, :description, :quantity, :weight, :city))
        
        if @product.save
            flash[:notice] = "Product was created successfully."
            redirect_to products_path(@product)
        else
            render 'new'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end
end
