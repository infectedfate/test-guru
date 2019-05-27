class FeedbackMailer < ApplicationMailer
  before_action :find_admin

   def send_feedback(feedback)
    @user = feedback.user
    @subject = feedback.title
    @message = feedback.body

     mail to: @admin.email, from: @user.email, subject: @subject
  end

   private

   def find_admin
    @admin = Admin.first
   end
end