

class Reminder < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user , :foreign_key => 'sender'
  belongs_to :to_user, :class_name=>"User",:foreign_key => 'recipient'

  attr_accessible :attachment
  has_attached_file :attachment,
                    :path => ":rails_root/public/uploads/reminders/:sender/:id/:basename.:extension"

  cattr_reader :per_page
  @@per_page = 12

  def download_allowed_for user
    #TODO: allow access to specific role
    return true
  end
end
