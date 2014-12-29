class ReportSection < ActiveRecord::Base
  belongs_to :report
  acts_as_list

  default_scope { order("position ASC") }
end
