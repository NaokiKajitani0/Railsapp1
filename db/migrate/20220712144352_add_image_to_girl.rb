class AddImageToGirl < ActiveRecord::Migration[5.2]
  def change
    add_column :girls, :image, :string
  end
end
