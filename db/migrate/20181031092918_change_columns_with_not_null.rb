class ChangeColumnsWithNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :e_mail, :string, null: false
    change_column :users, :password, :string, null: false
    change_column :users, :name, :string, null: false
    change_column :users, :mail_notice, :boolean, null: false

    change_column :tweets, :text, :string, null: false
    change_column :tweets, :privacy_status, :integer, null: false
    change_column :tweets, :user_id, :bigint, null: false

    change_column :replies, :tweet_id, :bigint, null: false
    change_column :replies, :target_tweet_id, :bigint, null: false

    change_column :images, :tweet_id, :bigint, null: false

    change_column :follows, :user_id, :bigint, null: false
    change_column :follows, :target_user_id, :bigint, null: false

    change_column :favs, :user_id, :bigint, null: false
    change_column :favs, :tweet_id, :bigint, null: false
  end
end
