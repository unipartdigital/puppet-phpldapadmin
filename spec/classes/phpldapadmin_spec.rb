require 'spec_helper'

describe 'phpldapadmin', :type => :module do

  shared_examples 'a Linux OS' do
    it { should compile.with_all_deps }
    it { should contain_class('phpldapadmin') }
    it { should contain_class('phpldapadmin::params') }
    it { should contain_class('phpldapadmin::package') }
    it { should contain_class('phpldapadmin::config') }
  end

  describe 'init' do
    context 'On a Debian OS' do
      it_behaves_like 'a Linux OS' do
        let :facts do
          {
            :operatingsystem => 'Debian',
            :osfamily => 'Debian',
          }
        end
      end
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
