class UserMailer < ApplicationMailer
    def welcome
        @name = params[:name] # params : données transmises par l'appelant.
        # assigner à une variable d'instance à utiliser dans la vue suivante
        mail(to: params[:to], subject:  t('.subject')) # envoie un email
      end
end


