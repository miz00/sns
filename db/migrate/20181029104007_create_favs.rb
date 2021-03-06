# frozen_string_literal: true

class CreateFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :favs do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps
    end
  end
end
