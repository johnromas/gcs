class Report < ActiveRecord::Base
  belongs_to :claim

  def remove_html(string)
    sanitize(string, :tags => {}) # empty tags hash tells it to allow no tags
  end
end
