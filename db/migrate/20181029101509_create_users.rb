# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :e_mail
      t.string :password
      t.string :name
      t.boolean :mail_notice

      t.timestamps
    end
  end
end
