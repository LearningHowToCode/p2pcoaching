class Student < ActiveRecord::Base
  has_one :user, as: :profile
  has_many :lessons

  has_many :purchases, class_name: 'Order', foreign_key: 'buyer_id'

  def country_name
    return '' if self.country.nil?
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
