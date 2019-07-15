class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :content
      t.boolean :public
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
