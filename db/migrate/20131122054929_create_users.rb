class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.string :password_digest

      t.timestamps
      add_index :users, :account, :unique => true
    end
  end
end
