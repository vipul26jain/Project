class CreateUserFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_followers do |t|
    	t.references	:follower
    	t.references	:following
      t.timestamps
    end

    add_foreign_key :user_followers, :users,                      column: :follower_id,            on_delete: :cascade
    add_foreign_key :user_followers, :users,                      column: :following_id,            on_delete: :cascade
  end
end
