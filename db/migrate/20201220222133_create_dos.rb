class CreateDos < ActiveRecord::Migration[5.2]
  def change
    create_table :dos do |t|
      t.integer :user_id
      t.text :do_text

      t.timestamps
    end
  end
end
