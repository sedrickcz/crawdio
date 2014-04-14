class Mailer < ActionMailer::Base
  default from: "shop@kingdomcomerpg.com"


  def activation_email user
    @user = user

    mail to: user.email
  end

  def confirmation_email order
    @order = order

    mail to: order.email
  end
end
