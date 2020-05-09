class AddLinkToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :link, :string
  end
end
