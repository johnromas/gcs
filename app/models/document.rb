class Document < ActiveRecord::Base
	mount_uploader :file_name, DocumentUploader

	# before_create :default_name

	# def default_name
	#   self.name ||= File.basename(file_name.filename, '.*').titleize if file_name
	# end
end
