require 'net/http'
require 'json'

class ProductsController < ApplicationController
    # Before action used to set the product needed for show, edit, update, and destroy function
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    # Index function, aka the dashboard which uses weather_description private function 
    # to get the weather text information and show the view index.html.erb
    def index
        @products = Product.all
        @products.each do |product|
            set_weather_description(product)
            product.weather_description = @weather_description.capitalize()
            product.save
        end
    end

    # New function to create a new product in the inventory and show the view new.html.erb
    def new
        @product = Product.new
    end

    # Show function to show a specific product from the database and show the view show.html.erb
    def show
        respond_to do |format|
            format.html
            format.csv { send_data @product.to_csv}
        end
    end

    # Edit function to edit a specific product from the database and show the view edit.html.erb
    def edit

    end

    # Update function to submit a specific product to the database with the new values entered by the user
    def update
        if @product.update(product_params)
            flash[:notice] = "Product was updated successfully."
            redirect_to @product
        else
            render 'edit'
        end
    end

    # Create function to create a new product and submit to the database using the values entered by the user
    def create
        @product = Product.new(product_params)
        
        if @product.save
            flash[:notice] = "Product was created successfully."
            redirect_to product_path(@product)
        else
            render 'new'
        end
    end

    # Destroy function to delete a product in the database
    def destroy
        @product.destroy
        redirect_to products_path
    end

    # Private functions
    private
    
    # Function used to get and set a specific product for operations
    def set_product
        @product = Product.find(params[:id])
    end

    # Function used to get the values entered by the user through the route
    def product_params
        params.require(:product).permit(:title, :description, :quantity, :weight, :city)
    end
    
    # Function to retrieve the weather description from OpenWeather API
    def set_weather_description (product)
        lon = '0'
        lat = '0'

        if product.city == "Montreal"
            lat = '45.5017'
            lon = '73.5673'
        elsif product.city == "Ottawa"
            lat = '45.5017'
            lon = '75.6972'
        elsif product.city == "Toronto"
            lat = '43.6532'
            lon = '79.3832'
            p lat
        elsif product.city == "Vancouver"
            lat = '49.2827'
            lon = '123.1207'
        end
        #API key from OpenWeather is required to be placed instead of APIKEY variable
        uri = URI('https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lon+'&appid='+APIKEY)
        response = Net::HTTP.get_response(uri)
        weather_response = response.body
        json_response = JSON.parse(weather_response)
        @weather_description = json_response["weather"][0]["description"]

    end
end
