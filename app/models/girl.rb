class Girl < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: :true
  mount_uploader :image, ImageUploader
end
