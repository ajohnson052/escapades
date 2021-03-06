class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :responses
  has_many :escapades
  has_many :commits
  has_many :tempships
  has_many :temps, through: :tempships
  has_many :inverse_tempships, class_name: "Tempship", foreign_key: "temp_id"
  has_many :inverse_temps, through: :inverse_tempships, source: :user
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user
end
