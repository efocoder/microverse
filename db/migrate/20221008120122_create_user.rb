class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :status

      t.timestamps null: false
    end

    add_index :users, :email,    unique: true
  end
end
