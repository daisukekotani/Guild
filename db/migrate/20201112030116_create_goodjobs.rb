class CreateGoodjobs < ActiveRecord::Migration[5.2]
  def change
    create_table :goodjobs do |t|
      t.integer :user_id
      t.integer :voice_id

      t.timestamps
    end
  end
end
