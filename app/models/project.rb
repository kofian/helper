class Project < ActiveRecord::Base

 belongs_to :user
 has_many :likes
 has_many :pledges
 has_many :donations, through: :pledges
 before_destroy :ensure_not_referenced_by_any_pledge

 validates :title, :description, presence: true
 validates :estimate, numericality: {greater_than_or_equal_to: 0.01}
 validates :title, uniqueness: true
 #validates :image_url, allow_blank: true, format: {
 # with: %r{\.(gif|jpg|png)\Z}i,
  #message: 'must be a URL for GIF, JPG or PNG image.'
 #} 
  validate :picture_size

  mount_uploader :picture, PictureUploader


  def self.latest
   Project.order(:updated_at).last
  end 

  def thumbs_up_total
    self.likes.where(like: true).size
  end
  def thumbs_down_total
    self.likes.where(like: false).size
  end

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_pledge
   if pledges.empty?
   return true
   else
   errors.add(:base, 'Pledges are present')
   return false
   end
  end
  
  def picture_size
   if picture.size > 5.megabytes
    errors.add(:picture, "should be less than 5mb")
   end
  end

end
