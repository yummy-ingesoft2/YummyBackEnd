class OrderNotifierJob < ApplicationJob
  queue_as :default

  def perform(clients,order)
    NotificationMailer.new_order(clients,order).deliver_now
  end
end
