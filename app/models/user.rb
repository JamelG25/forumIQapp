# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :forum_threads
  has_many :forum_posts

end
