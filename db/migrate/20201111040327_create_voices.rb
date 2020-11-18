class CreateVoices < ActiveRecord::Migration[5.2]
  def change
    create_table :voices do |t|
      t.integer :user_id
      t.string :image_id

      t.timestamps
    end
  end
end
