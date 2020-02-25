class CreateSubscribes < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribes do |t|
      t.references :user, foreign_key: true
      t.references :program, foreign_key: true
      t.boolean :banned, default: false

      t.timestamps
    end
    add_index :subscribes, [ :user_id, :program_id ], unique: true
  end
end
