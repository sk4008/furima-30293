class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :email
      t.string :encrypted_password
      t.date :date
      t.timestamps
    end
  end
end
