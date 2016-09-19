class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :token
      t.string :location
      t.timestamps
    end

    remove_column :users, :session_token
    
    add_index :sessions, :user_id
  end
end
