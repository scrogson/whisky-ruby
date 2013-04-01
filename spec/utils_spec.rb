require 'spec_helper'

describe Whisky::Utils do
  describe '.underscore' do
    it 'underscores class names' do
      klass = Whisky::Utils.underscore('UsersController')
      klass.should eq 'users_controller'
    end

    it 'respects modules' do
      mod_klass = Whisky::Utils.underscore('Admin::UsersController')
      mod_klass.should eq 'admin/users_controller'
    end
  end
end
