class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nama
      t.string :username
      t.string :email
      t.string :password
      t.string :gender
      t.integer :umur
      t.text :alamat

      t.timestamps
    end
  end
end
