class ContactMailer < ApplicationMailer
  def contact_mail(contact)
   @contact = contact

   mail to: "atsushimtzk3@hotmail.co.jp", subject: "お問い合わせの確認メール"
  end
end
