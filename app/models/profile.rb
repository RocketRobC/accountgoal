class Profile < ActiveRecord::Base
		belongs_to :user

		default_scope -> { order(fname: :desc) }

		mount_uploader :profileimage, ProfilePicUploader

	def name
		name = "#{fname} " + "#{lname}"
	end
end
