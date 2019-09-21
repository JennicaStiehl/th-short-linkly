class ShortLink < ApplicationRecord
  validates_presence_of :long_link
  validates_presence_of :user_id
  validates_uniqueness_of :user_id
  validates :long_link, url: true

  def encoded_id
    id.to_s(36)
  end

  def self.decoded_id(short_link_encoded_id)
    short_link_encoded_id.to_i(36)
  end

  def self.find_by_encoded_id(short_link)
    find(decoded_id(short_link))
  end

end
