class User < ActiveRecord::Base

  belongs_to :profile, polymorphic: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_profile

  def student?
    self.profile_type == 'Student'
  end

  def tutor?
    self.profile_type == 'Tutor'
  end

  private
  def create_profile
    if self.profile_type == 'tutor'
      Tutor.create!(user: self)
    else
      Student.create!(user: self)
    end
  end
end
