class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :admin, default: false
      t.integer :sex, null: false
      t.text :hobby
      t.text :character
      t.integer :generation, null: false
      t.integer :point, default: 0

      t.timestamps
    end
  end
end
