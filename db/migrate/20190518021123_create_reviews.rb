class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true
      t.integer :qualification
      t.text :content
      t.belongs_to :client, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
