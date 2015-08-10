class ContactMailer < ApplicationMailer
	default from: "rob@robcornishmusic.com"

	def response(contact_id)
		@contact = Contact.find(contact_id)
		mail(to: @contact.email, subject: "Thank you for contacting us.")
	end

	def received(contact_id)
		@contact = Contact.find(contact_id)
		mail(to: "rob@robcornishmusic.com", subject: "Website enquiry received")
	end


end
