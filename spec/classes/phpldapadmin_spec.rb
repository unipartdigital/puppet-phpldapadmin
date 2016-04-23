require 'spec_helper'

describe 'phpldapadmin', :type => :module do

  shared_examples 'a Linux OS' do
    it { should compile.with_all_deps }
    it { should contain_class('phpldapadmin') }
    it { should contain_class('phpldapadmin::params') }
    it { should contain_class('phpldapadmin::package') }
    it { should contain_class('phpldapadmin::config') }
    it { should contain_anchor('phpldapadmin::begin').that_comes_before('Class[phpldapadmin::package]') }
    it { should contain_anchor('phpldapadmin::end').that_requires('Class[phpldapadmin::config]') }
  end

  context 'On a Debian OS with valid params' do
    let(:params) { {
      :ldap_suffix => 'dc=example,dc=com',
      :ldap_host => 'localhost',
      :ldap_bind_id => 'username',
      :ldap_bind_pass => 'password',
    } }
    let(:facts) { {
      :operatingsystem => 'Debian',
      :osfamily => 'Debian',
    } }
    it_behaves_like 'a Linux OS' do
    end
  end

  context 'On a CentOS OS with valid params' do
    let(:params) { {
      :ldap_suffix => 'dc=example,dc=com',
      :ldap_host => 'localhost',
      :ldap_bind_id => 'username',
      :ldap_bind_pass => 'password',
    } }
    let(:facts) { {
      :operatingsystem => 'CentOS',
      :osfamily => 'RedHat',
    } }
    it_behaves_like 'a Linux OS' do
    end
  end

  context 'On a Debian OS with invalid params' do
    let(:params) { {
      :ldap_host => 'localhost',
      :ldap_bind_id => 'username',
      :ldap_bind_pass => 'password',
    } }
    let(:facts) { {
      :operatingsystem => 'Debian',
      :osfamily => 'Debian',
    } }
    it 'should fail if params not valid' do
      expect { should raise_error(/Invalid param/) }
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
