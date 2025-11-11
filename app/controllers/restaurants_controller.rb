class RestaurantsController < ApplicationController
  # /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # /restaurants/1
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # /restaurants/new
  def new
    # this empty instance is for the form builder
    @restaurant = Restaurant.new
  end

  # we need to submit a form to trigger this action (not from browser)
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again but with the @restaurant that didnt save
      # render :new, status: '422'
      render :new, status: :unprocessable_entity
    end
  end

  # /restaurants/1/edit
  def edit
    # this is just for the form
    @restaurant = Restaurant.find(params[:id])
  end

  # we need to submit a form to trigger this action (not from browser)
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # we need to click a button to trigger this action (no view)
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    # redirect_to restaurants_path, status: '303'
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
