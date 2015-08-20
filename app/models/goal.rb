class Goal < ActiveRecord::Base
	belongs_to :user
	# default_scope -> { order(updated_at: :desc) }
	validates :startdate, :enddate, :name, presence: true
	# validate :starts_in_future
	# validate :start_before_ends

	def self.future_events
		where("starts > ?", DateTime.current.beginning_of_day)
	end

	def start_before_ends
		if enddate.present?
			if startdate > enddate
				errors.add(:enddate, "End date can't be earlier than the start date")
			end
		else
			errors.add(:enddate, "Your goal needs an end date.")
		end
	end

	def starts_in_future
		if startdate.present? && startdate <= DateTime.current.beginning_of_day
			errors.add(:startdate, "Start date can't be before the current date")
		end
	end

	def self.order_created
		order(created_at: :desc)
	end

	def self.order_updated
		order(updated_at: :desc)
	end

	def self.order_completed
		order(completed_at: :desc)
	end

	def self.completed
		where(complete: true)
	end

	def self.incomplete
		where(complete: false)
	end

	def self.last7
    	where("completed_at >= ? ", 7.days.ago)
	end

	def self.previous_week
	  	where(completed_at: DateTime.current.beginning_of_day - 7.days..DateTime.current.beginning_of_day - 14.days)
	end

	def self.complete_before_enddate
		where("complete = true AND completed_at <= enddate")
	end

	def percent_of(n)
    	self.to_f / n.to_f * 100.0
  	end


	# def self.last_12_months
	# 	where(range = (DateTime.now.beginning_of_month - 11.months)..DateTime.now.end_of_month)
	# end



end
