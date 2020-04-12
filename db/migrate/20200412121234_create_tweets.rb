class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text		:content
      t.references	:user
      t.timestamps
    end
  end
end
