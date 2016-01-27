require 'spec_helper'
 
describe 'atlassian_sdk', :type => 'class' do

  context "Should install SDK 5.0.3" do

    let(:params) { { :versions => ['5.0.3'] } }

    it do
      should contain_exec('Download atlassian-plugin-sdk-5.0.3.tar.gz').with(
        'command' => 'curl -s -L https://maven.atlassian.com/content/groups/public/com/atlassian/amps/atlassian-plugin-sdk/5.0.3/atlassian-plugin-sdk-5.0.3.tar.gz -o /opt/atlassian-plugin-sdk-5.0.3.tar.gz'
      )
      should contain_exec('Extract /opt/atlassian-plugin-sdk-5.0.3.tar.gz').with(
        'command' => 'tar zxf /opt/atlassian-plugin-sdk-5.0.3.tar.gz -C /opt'
      )
    end
  end

  context "Should install SDK 5.0.3 and 4.2.20" do

    let(:params) { { :versions => ['5.0.3', '4.2.20'] } }

    it do
      should contain_exec('Download atlassian-plugin-sdk-5.0.3.tar.gz').with(
        'command' => 'curl -s -L https://maven.atlassian.com/content/groups/public/com/atlassian/amps/atlassian-plugin-sdk/5.0.3/atlassian-plugin-sdk-5.0.3.tar.gz -o /opt/atlassian-plugin-sdk-5.0.3.tar.gz'
      )
      should contain_exec('Extract /opt/atlassian-plugin-sdk-5.0.3.tar.gz').with(
        'command' => 'tar zxf /opt/atlassian-plugin-sdk-5.0.3.tar.gz -C /opt'
      )

      should contain_exec('Download atlassian-plugin-sdk-4.2.20.tar.gz').with(
        'command' => 'curl -s -L https://maven.atlassian.com/content/groups/public/com/atlassian/amps/atlassian-plugin-sdk/4.2.20/atlassian-plugin-sdk-4.2.20.tar.gz -o /opt/atlassian-plugin-sdk-4.2.20.tar.gz'
      )
      should contain_exec('Extract /opt/atlassian-plugin-sdk-4.2.20.tar.gz').with(
        'command' => 'tar zxf /opt/atlassian-plugin-sdk-4.2.20.tar.gz -C /opt'
      )
    end
  end

end
