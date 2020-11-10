class ChangeDataJobToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :job, :string
  end
end
