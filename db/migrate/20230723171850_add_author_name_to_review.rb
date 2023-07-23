class AddAuthorNameToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :author_name, :string
  end
end
