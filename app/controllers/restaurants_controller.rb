class RestaurantsController < ApplicationController
  def index
    @restaurants = if params[:search]
                     Restaurant.joins(:dishes).where('dishes.name ILIKE ?', "%#{params[:search]}%").distinct
                   else
                     Restaurant.all
                   end
  end

  def new
    @restaurant = Restaurant.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant added successfully!"
      redirect_to restaurants_path
    else
      render :index
    end
  end

  def change_status
    @restaurant = Restaurant.where(id: params[:id]).first
    new_status = @restaurant.status == 'open' ? 'closed' : 'open'
    UpdateStatusRestaurantJob.set(wait: 5.minutes).perform_later(@restaurant.id)
    redirect_to restaurants_path, notice: "Restaurant status will be changed to #{new_status.capitalize} after 5 minutes!"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
