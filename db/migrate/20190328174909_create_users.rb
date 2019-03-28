class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email_address
      t.string :password

      t.timestamps
    end
  end
end
