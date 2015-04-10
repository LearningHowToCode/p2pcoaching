class Tutor < ActiveRecord::Base

  # Do not remove, needed for seeds, in case of needing more subjects add from admin interface
  SUBJECTS = ['English', 'Business English', 'TOEFL', 'SAT', 'GRE', 'GMAT',
              'Essay Editing', 'General Admissions Advice', 'Other']
  INDUSTRIES = ['Consulting', 'Investment Banking', 'Venture Capital',
                'Private Equity', 'Hedge Fund', 'Technology', 'Startup', 'Other']

  LANGUAGES = ['English', '中文', '日本語', '한국어', 'Español']
  INSTITUTIONS = ['Brown','Columbia','Cornell','Dartmouth','Harvard', 'MIT','Princeton', 'Stanford','UPenn', 'Yale', 'Other']
  COMPANIES = ["Bain and Company", "Boton Consulting Group", "McKinsey",
               "Goldman Sachs", "UBS", "Google", "Other"]

  has_one :user, as: :profile, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :sales, class_name: 'Order', foreign_key: 'seller_id', dependent: :destroy
  has_and_belongs_to_many :subjects

  mount_uploader :image, ImageUploader

  validates_presence_of  'name', 'price', 'bio', 'undergraduate_institution',
                         'subjects', 'long_bio', 'skype_id','gmail_address',
                          on: :update

  scope :completed, ->{ where(completed_profile: true) }
  delegate :email, to: :user

  def is_the?(current_user)
    return false if current_user.nil?

    current_user == self.user
  end

  def has_language?(language)
    self.languages.split(', ').include?(language) if self.languages.present?
  end

  def other_subjects
    self.subjects.where(own: false).map(&:name).join(', ') if self.subjects.present?
  end
end
