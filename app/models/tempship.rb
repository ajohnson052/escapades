class Tempship < ActiveRecord::Base
  belongs_to :user
  belongs_to :temp, class_name: "User"
  validates_uniqueness_of :temp, scope: :user
  validate :check_user

  def check_user
    if self.temp_id == self.user_id
      errors.add(:temp, "You can't add yourself")
    end
  end

end
