class CreateEmoticons < ActiveRecord::Migration
  def change
    create_table :emoticons do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
  add_index :emoticons, [:user_id, :created_at]
end
