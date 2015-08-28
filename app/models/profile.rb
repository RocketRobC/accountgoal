class Profile < ActiveRecord::Base
		belongs_to :user

		# default_scope -> { order(fname: :desc) }

		mount_uploader :profileimage, ProfilePicUploader

		validates :fname, :lname, presence: true, on: :update

	def complete?
		!incomplete?
	end

	def incomplete?
		fname.blank? || lname.blank?
	end

	def name
		"#{fname} #{lname}"
	end

	def initials
		"#{fname}"[0,1] + "#{lname}"[0,1]
	end

	def self.search(search)
    	where('name  ILIKE ?', "%#{search}%")
    	where('city ILIKE ?', "%#{search}%")
    	where('country ILIKE ?', "%#{search}%")
  	end
end
