class CreateDoComments < ActiveRecord::Migration[5.2]
  def change
    create_table :do_comments do |t|
      t.text :todo_comment
      t.integer :user_id
      t.integer :do_id

      t.timestamps
    end
  end
end
