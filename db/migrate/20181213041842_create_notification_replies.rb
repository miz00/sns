class CreateNotificationReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_replies do |t|
      t.references :notification, foreign_key: true
      t.references :reply, foreign_key: true

      t.timestamps
    end
  end
end
