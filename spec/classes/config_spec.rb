require 'spec_helper'

describe 'phpldapadmin', :type => :module do

  shared_examples 'a Linux OS' do
    it { should compile } 
    it { should contain_class('phpldapadmin::config') }
  end

  describe 'config' do
    context 'On Debian' do
      it_behaves_like 'a Linux OS' do
        let :facts do
          {
            :operatingsystem => 'Debian',
            :osfamily => 'Debian',
          }
        end
        it { should contain_file('/etc/phpldapadmin/config.php') }
        it { should contain_file('/etc/phpldapadmin/config.php').with_ensure('file') }
        it { should contain_file('/etc/phpldapadmin/config.php').with_mode('0640') }
        it { should contain_file('/etc/phpldapadmin/config.php').with_owner('root') }
        it { should contain_file('/etc/phpldapadmin/config.php').with_group('www-data') }
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
