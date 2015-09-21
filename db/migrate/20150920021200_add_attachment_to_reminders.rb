class AddAttachmentToReminders < ActiveRecord::Migration
  def self.up
    add_column :reminders, :attachment_file_name, :string
    add_column :reminders, :attachment_content_type, :string
    add_column :reminders, :attachment_file_size, :integer
    add_column :reminders, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :reminders, :attachment_updated_at
    remove_column :reminders, :attachment_file_size
    remove_column :reminders, :attachment_content_type
    remove_column :reminders, :attachment_file_name
  end
end
