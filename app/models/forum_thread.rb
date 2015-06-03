# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  subject    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_forum_threads_on_user_id  (user_id)
#

class ForumThread < ActiveRecord::Base
  belongs_to :user
end
