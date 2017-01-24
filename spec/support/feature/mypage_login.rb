RSpec.shared_context 'my page login in feature' do
  let(:user) { create(:user) }

  before { login_as user }
end
