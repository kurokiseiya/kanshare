class AddProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :english_name, :string
    add_column :users, :place, :string
    add_column :users, :birthday, :string
    add_column :users, :like, :string
    add_column :users, :dream, :text
  end
end
