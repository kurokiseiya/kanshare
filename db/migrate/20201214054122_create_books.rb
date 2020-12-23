class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :book_title
      t.text :book_subtitle
      t.text :book_caption
      t.string :book_image_id
      t.integer :user_id
      t.string :book_url

      t.timestamps
    end
  end
end
