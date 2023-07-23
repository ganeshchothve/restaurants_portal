class UpdateStatusRestaurantJob < ApplicationJob
  queue_as :default

  def perform(restaurant_id)
    restaurant = Restaurant.find(restaurant_id)
    new_status = restaurant.status == 'open' ? 'closed' : 'open'
    restaurant.update(status: new_status)
  end
end
