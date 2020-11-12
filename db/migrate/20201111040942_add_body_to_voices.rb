class AddBodyToVoices < ActiveRecord::Migration[5.2]
  def change
    add_column :voices, :body, :text
  end
end
