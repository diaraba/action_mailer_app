require "rails_helper"


RSpec.describe UserMailer, type: :mailer do
  describe "UserMailer welcome method" do
    it "Que le courriel est ajouté à la file d'attente des courriers sortants." do
      expect {
        perform_enqueued_jobs do
          UserMailer.with(to: "test@example.com", name: "dic").welcome.deliver_now
        end
      }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
    it "L'information envoyée par courriel est conforme à l'intention" do
      UserMailer.with(to: "test@example.com", name: "dic").welcome.deliver_now
      email = ActionMailer::Base.deliveries.last
      expect(email.to).to eq ["test@example.com"]
      expect(email.from).to eq ["admin@example.com"]
      expect(email.subject).to eq "Registration complète"
      expect(email.text_part.decoded).to include "dic"
      expect(email.html_part.decoded).to include "dic"
    end
  end
end
