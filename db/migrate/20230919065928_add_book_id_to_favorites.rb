class AddBookIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :book, null: false, foreign_key: true
  end
end
