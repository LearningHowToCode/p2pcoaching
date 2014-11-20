class Student < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :purchases, class_name: 'Order', foreign_key: 'buyer_id', 
           dependent: :destroy

  validates_presence_of 'name', 'country', 'preference', on: :update
  validate :tool_presence, on: :update

  def country_name
    return '' if self.country.nil?

    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  private
  def tool_presence
    if self.skype_id.blank? && self.gmail_address.blank?
      self.errors.add(:base, 'You have to provide either your Skype ID or your Gmail address (for Google Hangouts).')
    end
  end
end
