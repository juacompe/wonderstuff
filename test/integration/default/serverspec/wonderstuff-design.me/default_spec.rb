require 'spec_helper'

describe "Wonderstuff Design" do

    it "should install the lighttpd package" do
        expect(package "lighttpd").to be_installed
    end

    describe service("lighttpd") do
        context "it should be enabled and running"
        it { should be_enabled }
        it { should be_running }
    end

    it "should listen at port 80" do
        expect(port(80)).to be_listening
    end

    it "should render the Wonderstuff Design web page" do
        expect(file('/var/www/index.html')).to be_file
        expect(file('/var/www/index.html')).to contain "Wonderstuff Design is a boutique graphics design agency." 
    end
end
