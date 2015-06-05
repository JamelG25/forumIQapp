# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  body            :string
#  user_id         :integer
#  forum_thread_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_forum_posts_on_forum_thread_id  (forum_thread_id)
#  index_forum_posts_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_1d9fa832c6  (forum_thread_id => forum_threads.id)
#  fk_rails_c658fb3b75  (user_id => users.id)
#

class ForumPost < ActiveRecord::Base
  belongs_to :forum_thread
  belongs_to :user
  validates :body, presence: true
end
