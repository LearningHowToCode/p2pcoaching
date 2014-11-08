class User < ActiveRecord::Base

  belongs_to :profile, polymorphic: true, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_profile

  def student?
    self.profile_type == 'StudentProfile'
  end

  def tutor?
    self.profile_type == 'TutorProfile'
  end

  private
  def create_profile
    if self.profile_type == 'tutor'
      TutorProfile.create(user: self)
    else
      StudentProfile.create(user: self)
    end
  end
end
