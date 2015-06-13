require 'spec_helper'

describe 'postgresql::client', :type => :class do
  let :facts do
    {
      :osfamily               => 'RedHat',
      :operatingsystem        => 'RedHat',
      :operatingsystemrelease => '7.0',
      :lsbdistid              => 'RedHatEnterpriseServer',
      :lsbdistcodename        => 'Maipo',
    }
  end

  describe 'with parameters' do
    let :params do
      {
        :package_ensure => 'absent',
        :package_name => 'mypackage',
      }
    end

    it 'should modify package' do
      is_expected.to contain_package("postgresql-client").with({
        :ensure => 'absent',
        :name => 'mypackage',
        :tag => 'postgresql',
      })
    end
  end

  describe 'with no parameters' do
    it 'should create package with postgresql tag' do
      is_expected.to contain_package('postgresql-client').with({
        :tag => 'postgresql',
      })
    end
  end
end
