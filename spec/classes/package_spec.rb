require 'spec_helper'

describe 'phpldapadmin', :type => :module do

  describe 'package' do

    context 'On a Debian OS' do
      let :facts do
        {
          :operatingsystem => 'Debian',
          :osfamily => 'Debian',
        }
      end
      it { should contain_package('phpldapadmin') }
    end

    context 'On other OS' do
      let :facts do
        {
          :operatingsystem => 'xxx',
          :osfamily => 'xxx',
        }
      end
      it 'should fail if OS not supported' do 
        expect { should compile }.to raise_error(/Unsupported OS family/)
      end
    end
  end
end
