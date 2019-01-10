# frozen_string_literal: true

class ChangeColumnBooleanDefaultOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :mail_notice, :boolean, default: false
  end
end
