class Image < ActiveRecord::Base
  belongs_to :gallery, dependent: :destroy

  has_attached_file :attachment, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '900x300>',
  }

  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
end
