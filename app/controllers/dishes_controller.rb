class DishesController < ApplicationController
  before_action :set_restaurant

  def index
    if @restaurant
      @dishes = @restaurant.dishes
    else
      @dishes = Dish.all
    end
  end

  def new
    @dish = Dish.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      flash[:notice] = "Restaurant added successfully!"
      redirect_to restaurants_path
    else
      flash[:alert] = "Failed to add Dish"
      redirect_to restaurants_path
    end
  end 

  private

  def dish_params
    params.require(:dish).permit(:name, :price, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.where(id: params[:restaurant_id]).first
  end

end
