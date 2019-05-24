class OrderMailer < ApplicationMailer
  default from: 'REME Centro de Notificaciones <notificaciones_reme@lacerta.cl>'
  default_url_options[:host] = 'http://137.135.121.245:3131/'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    @greeting = ""

    mail to: "rodrigo.mera@gmail.com", cc: "rodrigo.mera@lacerta.cl, mmera@remespa.cl", subject: 'Nueva Solicitud de Compra por Aprobar'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.approved.subject
  #
  def approved
    @order = order
    @greeting = "Hi"

    mail to: "rodrigo.mera@gmail.com", subject: 'OC Aprobada'
  end
end
