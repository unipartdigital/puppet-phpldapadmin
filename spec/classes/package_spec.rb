require 'spec_helper'

describe 'phpldapadmin', :type => :module do

  shared_examples 'a Linux OS' do
    it { should compile.with_all_deps }
    it { should contain_class('phpldapadmin::package') }
    it { should contain_package('phpldapadmin') }
  end

  describe 'package' do
    context 'On a Debian OS' do
      let(:facts) { {
        :operatingsystem => 'Debian',
        :osfamily => 'Debian',
      } }
      it_behaves_like 'a Linux OS' do
      end
    end

    context 'On a CentOS OS' do
      let(:facts) { {
        :operatingsystem => 'CentOS',
        :osfamily => 'RedHat',
      } }
      it_behaves_like 'a Linux OS' do
      end
    end

    context 'On other OS' do
      let(:facts) { {
        :operatingsystem => 'xxx',
        :osfamily => 'xxx',
      } }
      it 'should fail if OS not supported' do
        expect { should compile }.to raise_error(/Unsupported OS family/)
      end
    end
  end
end
