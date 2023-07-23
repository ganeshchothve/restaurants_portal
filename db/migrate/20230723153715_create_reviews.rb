class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.text :author_name
      t.integer :rating
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
