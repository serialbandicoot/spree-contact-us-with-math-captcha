class Inquiry < ActiveRecord::Base
  attr_accessible :name, :email, :inquiry_type, :order_no, :message, :captcha_solution, :captcha_secret

  has_captcha
  validates :name ,:presence => true
  validates :email ,:presence => true
  validates :message ,:presence => true
   
 after_save :deliver_notification_email


  def deliver_notification_email
    InquiryMailer.notification(self).deliver
    # For delayed_job
    # InquiryMailer.send_later(:deliver_notification, self)
  end


end
