def sign_in_admin
  let!(:admin) { FactoryBot.create(:administrator) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:authenticate_administrator!).and_return(admin)
    allow_any_instance_of(ApplicationController).to receive(:current_administrator).and_return(admin)
  end
end
