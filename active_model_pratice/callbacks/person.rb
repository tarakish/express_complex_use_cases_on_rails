class Person
	extend ActiveModel::Callbacks

	attr_accessor :create_at, :updated_at

  define_model_callbacks :save
	before_save :record_timestamps

	def save # ActiveRecordと同名でなくてもOK
		run_callbacks :save do
			true # 中身記述
    end
	end

	private
	
	def record_timstamps
		current_time = Time.current

		self.created_at ||= current_time
		self.update_at = current_time
	end
end