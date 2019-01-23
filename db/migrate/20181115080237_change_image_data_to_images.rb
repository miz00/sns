# frozen_string_literal: true

class ChangeImageDataToImages < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :image_data, :text, null: false
  end
end
