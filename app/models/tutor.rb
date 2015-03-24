class Tutor < ActiveRecord::Base

  # Do not remove, needed for seeds, in case of needing more subjects add from admin interface
  SUBJECTS = ['English', 'Business English', 'TOEFL', 'SAT', 'GRE', 'GMAT',
              'Essay Editing', 'General Admissions Advice', 'Other']

  LANGUAGES = ['English', '中文', '日本語', '한국어', 'Español']
  INSTITUTIONS = ['Brown','Columbia','Cornell','Dartmouth','Harvard', 'MIT','Princeton', 'Stanford','UPenn', 'Yale', 'Other']

  has_one :user, as: :profile, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :sales, class_name: 'Order', foreign_key: 'seller_id', dependent: :destroy
  has_and_belongs_to_many :subjects

  mount_uploader :image, ImageUploader

  validates_presence_of  'name', 'price', 'bio',
                         'undergraduate_institution', 'undergraduate_major',
                         'subjects', 'long_bio', 'skype_id','gmail_address',
                         'languages', on: :update

  scope :completed, ->{ where(completed_profile: true) }
  delegate :email, to: :user

  def is_the?(current_user)
    return false if current_user.nil?

    current_user == self.user
  end

  def has_language?(language)
    self.languages.split(', ').include?(language) if self.languages.present?
  end

  def has_subject?(subject)
    self.subject.split(', ').include?(subject) if self.subject.present?
  end

  def other_subject
    self.subject.split(',').last if self.subject.present?
  end
end
