class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:chef, :show, :edit, :update, :destroy]
  # /restaurants
  def index
    @restaurants = Restaurant.all
  end

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  def chef
    @chef_name = @restaurant.chef_name
  end

  # /restaurants/1
  def show
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
  end

  # we need to submit a form to trigger this action (not from browser)
  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # we need to click a button to trigger this action (no view)
  def destroy
    @restaurant.destroy
    # redirect_to restaurants_path, status: '303'
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
