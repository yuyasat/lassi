RSpec.shared_context 'mypage login' do
  let(:user) { create(:user) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end
end
