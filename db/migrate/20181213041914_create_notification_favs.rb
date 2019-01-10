# frozen_string_literal: true

class CreateNotificationFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_favs do |t|
      t.references :notification, foreign_key: true
      t.references :fav, foreign_key: true

      t.timestamps
    end
  end
end
