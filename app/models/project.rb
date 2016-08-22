class Project < ActiveRecord::Base
	belongs_to :user
	has_many :tasks

	def completed?
		!completed_at.blank?
	end
	
end
