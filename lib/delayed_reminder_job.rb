

class DelayedReminderJob

  def initialize(*args)
    opts = args.extract_options!
    @sender_id = opts[:sender_id]
    @recipient_ids = Array(opts[:recipient_ids]).flatten.uniq
    @subject = opts[:subject]
    @attachment = opts[:attachment]
    @body = opts[:body]
  end

  def perform
    @recipient_ids.each do |r|
      Reminder.create(:sender => @sender_id,
                      :recipient => r,
                      :subject => @subject,
                      :body => @body,
                      :attachment => @attachment)
    end
  end
end
