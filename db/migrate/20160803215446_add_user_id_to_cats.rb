class AddUserIdToCats < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, index: true
    # add_index :cats, :user_id
  end
end
