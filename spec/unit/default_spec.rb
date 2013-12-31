require 'chefspec'

describe 'wonderstuff::default' do
    let(:chef_run) do
        runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
        Chef::Config.force_logger true
        runner.converge('recipe[wonderstuff::default]')
    end

    it "installs the lighttpd package" do
        expect(chef_run).to install_package 'lighttpd'
    end

    it "creates a webpage to be served" do
        content = "Wonderstuff Design is a boutique graphics design agency."
        expect(chef_run).to render_file('/var/www/index.html').with_content(content)
        expect(chef_run).to create_cookbook_file('/var/www/index.html').with(owner: 'www-data', group: 'www-data')
    end

    it "starts the lighttpd service" do
        expect(chef_run).to start_service 'lighttpd'
    end

    it "enables the lighttpd service" do
        expect(chef_run).to enable_service 'lighttpd'
    end
end
