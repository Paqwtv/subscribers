class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, limit: 255, null: false, index: true, unique: true
      t.string :name, limit: 64
      t.string :password, limit: 128, null: false

      t.timestamps
    end
  end
end
