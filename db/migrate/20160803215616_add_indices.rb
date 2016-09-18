class AddIndices < ActiveRecord::Migration
  def change
    add_index :users, :session_token
    add_index :users, :user_name
    add_index :cats, :user_id
  end
end
