require 'spec_helper'
describe 'mwdevel_argus' do

  context 'with defaults for all parameters' do
    it { should contain_class('mwdevel_argus') }
  end
end
