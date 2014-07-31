require 'spec_helper'

describe 'phpldapadmin', :type => :module do

  shared_examples 'a Linux OS' do
    it { should compile } 
    it { should contain_class('phpldapadmin::config') }
  end

  describe 'config' do
    context 'with default params' do
      it_behaves_like 'a Linux OS' do
        let :facts do
          {
            :operatingsystem => 'Debian',
            :osfamily => 'Debian',
          }
        end
      end
    end
  end

end
