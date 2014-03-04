class Mailer < ActionMailer::Base
  default from: "warhorse@sedrick.cz"


  def activation_email user
    @user = user

    mail to: user.email
  end

  def confirmation_email order
    @order = order

    mail to: order.email
  end
end
