class Image < ApplicationRecord
  validates_presence_of :url
  validates :url, format: { with: URI.regexp(%w[http https]), message: 'must be a valid URL' }
end
