
class InboxMailJob < Struct.new(:sender,:to,:subject,:body)
  def perform
    UserNotifier.deliver_inbox(sender,to,subject,body)
  end
end