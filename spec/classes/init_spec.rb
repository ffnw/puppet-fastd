require 'spec_helper'
describe 'fastd' do

  context 'with defaults for all parameters' do
    it { should contain_class('fastd') }
  end
end
