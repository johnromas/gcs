class Report < ActiveRecord::Base
	# attr_accessible :report_sections_attributes
  belongs_to :claim
  has_many :report_sections
  accepts_nested_attributes_for :report_sections
  mount_uploader :photo, ClaimantPhotoUploader

  def remove_html(string)
    sanitize(string, :tags => {}) # empty tags hash tells it to allow no tags
  end
end
