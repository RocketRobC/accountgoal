class Profile < ActiveRecord::Base
		belongs_to :user

		default_scope -> { order(fname: :desc) }

		mount_uploader :profileimage, ProfilePicUploader

		# validates :fname, :lname, presence: true

	def name
		name = "#{fname} " + "#{lname}"
	end

	def self.search(search)
    	where('name  ILIKE ?', "%#{search}%")
    	where('city ILIKE ?', "%#{search}%")
    	where('country ILIKE ?', "%#{search}%")
  	end
end
