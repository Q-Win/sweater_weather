require 'rails_helper'

describe User, type: :model do

  describe 'Relationships' do
    it { should belong_to(:user) }
 end
end
