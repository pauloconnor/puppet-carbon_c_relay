require 'spec_helper'

describe 'carbon_c_relay' do
  let(:facts) {
    {
      :osfamily => 'Ubuntu',
      :concat_basedir => '/dne',
     }
  }

  it 'should compile' do should create_class('carbon_c_relay') end
  it { should contain_class('carbon_c_relay::config')}

  context 'package' do
    context 'defaults' do
      it { should contain_package('carbon_c_relay').with_ensure('latest') }
    end
  end

end
