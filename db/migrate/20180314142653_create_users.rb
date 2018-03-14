class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :bankroll, :default => 1000
      t.timestamps
    end
  end
end
