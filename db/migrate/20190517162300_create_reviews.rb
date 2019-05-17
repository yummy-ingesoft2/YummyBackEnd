class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :qualification
      t.text :content

      t.timestamps
    end
  end
end
