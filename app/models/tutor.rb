class Tutor < ActiveRecord::Base

  SUBJECTS = ['English', 'Business English', 'TOEFL', 'SAT', 'GRE', 'GMAT',
              'Essay Editing', 'General Admissions Advice']
  LANGUAGES = ['English', 'Chinese', 'Japanese', 'Korean', 'Spanish']
  INSTITUTIONS = ['Harvard', 'MIT', 'Yale', 'Princeton', 'Stanford', 'Other']

  has_one :user, as: :profile, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :sales, class_name: 'Order', foreign_key: 'seller_id', dependent: :destroy

  mount_uploader :image, ImageUploader

  validates_presence_of  'name', 'price', 'bio', 'image',
                         'undergraduate_institution', 'undergraduate_major',
                         'subject', 'long_bio', 'skype_id','gmail_address',
                         'languages', on: :update

  scope :completed, ->{ where(completed_profile: true) }

  def has_language?(language)
    self.languages.split(', ').include?(language)
  end

  def has_subject?(subject)
    self.subject.split(', ').include?(subject)
  end
end
