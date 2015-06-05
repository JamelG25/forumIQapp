class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.string :body
      t.references :user, forum: true
      t.references :forum_thread, forum: true

      t.timestamps null: false
    end
    add_foreign_key :forum_posts, :users
    add_foreign_key :forum_posts, :forum_threads
  end
end
