require 'rails_helper'

describe User, type: :model do

  describe 'Validations' do
    xit { should validate_presence_of(:email)}
    xit { should validate_uniqueness_of(:email)}
  end
end
