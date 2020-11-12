class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :voice_id

      t.timestamps
    end
  end
end
