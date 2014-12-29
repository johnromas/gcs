class ReportSection < ActiveRecord::Base
  belongs_to :report
  acts_as_list
end
