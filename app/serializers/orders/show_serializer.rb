class Orders::ShowSerializer < OrderSerializer
   attributes :id, :product
def product
    {id: self.object.product_id,
    quantity: self.object.quantity,
    cost:self.object.cost
    }
  end
end