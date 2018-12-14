class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :text
      t.references :user, foreign_key: true
      t.integer :privacy_status

      t.timestamps
    end
  end
end
