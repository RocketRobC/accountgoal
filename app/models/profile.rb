class Profile < ActiveRecord::Base
	belongs_to :user

	# default_scope -> { order(fname: :desc) }

	mount_uploader :profileimage, ProfilePicUploader

	validates :fname, :lname, presence: true, on: :update

	scope :search, -> (str) { var = "%#{str}%"; where('city ILIKE ? or country ILIKE ? or fname ILIKE ? or lname ILIKE ?', var, var, var, var) }

	def complete?
		!incomplete?
	end

	def incomplete?
		fname.blank? || lname.blank?
	end

	def name
		"#{fname}"[0,100].capitalize + " " + "#{lname}"[0,100].capitalize
	end

	def initials
		"#{fname}"[0,1].capitalize + "#{lname}"[0,1].capitalize
	end

	def capitalize_first_letter
		self.sub(/^./) { $1.capitalize }
	end

end
