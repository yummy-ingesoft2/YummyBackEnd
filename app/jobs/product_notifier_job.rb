class ProductNotifierJob < ApplicationJob
  queue_as :default

  def perform(user,product)
    NotificationMailer.new_product(user,product).deliver_now
  end
end
