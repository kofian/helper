class Project < ActiveRecord::Base

   STATES = ["closed", "open"]

 belongs_to :user
 has_many :likes
 has_many :pledges
 has_many :donations, through: :pledges
 before_destroy :ensure_not_referenced_by_any_pledge

 validates :title, :description, :contact_email, presence: true
 validates :estimate, numericality: {greater_than_or_equal_to: 0.01}
 validates :title, uniqueness: true
 #validates :image_url, allow_blank: true, format: {
 # with: %r{\.(gif|jpg|png)\Z}i,
  #message: 'must be a URL for GIF, JPG or PNG image.'
 #} 
  validate :picture_size
  validates :slug, presence: true, uniqueness: true

  #serialize :custom_fields, Array

  scope :recent, -> { order('title ASC') }
  scope :live, -> { where("state = 'open' and (closes_at is null or closes_at > ?)", Time.current).order('closes_at ASC') }
  scope :top_featured, -> { where(featured: true) }
  scope :top_watched, -> { where(watch: true) }
 

  before_validation :generate_slug
  before_save :update_closes_at_if_manually_closed

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

  def custom_fields_string=(custom_fields_string)
   self.custom_fields = self.custom_fields_string_to_array(custom_fields_string)
  end
  def custom_fields_string_to_array(string)
    (string || '').split(',').map(&:strip).reject(&:blank?).uniq
  end
  def custom_fields_string
    custom_fields.join(',')
  end

  def to_param
     slug
  end
  
  def generate_slug
    self.slug = title.parameterize if slug.blank?
  end

  def to_s
    title
  end

   def open?
     state == 'open' && (closes_at.nil? || closes_at > Time.current)
   end

   def close?
     !open?
   end

   def past_open?
     state == 'open' && closes_at < Time.current
   end

   def unmet_requirements_for_scheduling
     missing_prereqs = []

     missing_prereqs << "Project must have a start date" unless start_date
     missing_prereqs << "Project must have a end date" unless end_date

     missing_prereqs
   end

   def archive
     if current?
        update_attribute(:archived, true)
     end
   end
  
   def unarchive
     if archived?
        update_attribute(:archived, false)
     end
   end

   def faeture
     if not_priority?
        update_attribute(:featured, true)
     end
   end

   def unfaeture
     if featured?
        update_attribute(:featured, false)
     end
   end

   def not_priority?
     !featured?
   end

  def current?
    !archived?
  end

  def interesting?
    !watch?
  end
  def watched
    if interesting?
      update_attribute(:watch, true)
    end
  end
  def unwatched
    if watched?
      update_attribute(:watch, false)
    end
  end

  def donation_opens
    opens_at && opens_at.to_s(:long_with_zone)
  end
  def donation_closes
   closes_at && closes_at.to_s(:long_with_zone)
  end

   def fundraising_date(fundraising_day)
     start_date + (fundraising_day - 1).days
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

   def update_closes_at_if_manually_closed
      if changes.key?(:state) && changes[:state] == ['open', 'closed']
        self.closes_at = DateTime.now
      end
   end

end


# == Schema Information
#
#  Table name: projects
#   
#   t.string   "title"
#   t.text     "description"
#   t.decimal  "estimate",    precision: 8, scale: 2
#   t.datetime "created_at",                          null: false
#   t.datetime "updated_at",                          null: false
#   t.integer  "user_id"
#   t.string   "picture"
#   t.string   "slug"
#   t.string   "contact_email"
#   t.string   "state"
#   t.string   "archived",      default(FALSE)    
#   t.text     "review_tags"
#   t.string   "url"
#   t.datetime  "start_date"
#   t.datetime  "end_date"
#   t.text      "custom_fields"
#   t.datetime  "opens_at"
#   t.datetime  "closes_at"
#   t.boolean   "featured"
#   t.boolean   "watch"
#
#add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree
#
#
#
#
