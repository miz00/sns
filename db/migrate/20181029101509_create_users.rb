class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :e-mail
      t.string :password
      t.string :name
      t.boolean :mail-notice

      t.timestamps
    end
  end
end
