class CreateForumThreads < ActiveRecord::Migration
  def change
    create_table :forum_threads do |t|
      t.string :subject
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :forum_threads, :users
  end
end