class Notifier < ActionMailer::Base
  # default :from => "from@example.com"
# 
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.multipart_alternative.subject
  #
  def multipart_alternative
    @from = mail_info["from_email"]
    @recipients = "bruxa.bruxa@gmail.com"
    @subject = mail_info["subject"]
    @mail_info = mail_info
    @body["mail_info"] = mail_info
    @sent_on = Time.now
    part :content_type => "text/plain",
    :body => render_message("multipart_alternative_plain", "mail_info" => mail_info)
    part :content_type => "text/html",
    :body => render_message("multipart_alternative", "mail_info" => mail_info)    
  end
  
  def message(author)
    @recipients       = "me@mysite.com"
    @from             = author[:email]
    @subject          = "New message"
    @body['name']     = author[:name]
    @body['email']    = author[:email]
    @body['message']  = author[:message]
  end

end
