require 'spec_helper'
require 'evil-chef'

describe EvilChef::Runner do
	before(:each) do
		@runner = EvilChef::Runner.new
	end

	it "should run a recipe successfully" do
		@runner.recipe_eval do
			log "TEst"
			file "/tmp/test.txt" do
				content "TEST"
			end
		end
		File.read("/tmp/test.txt").should eq("TEST")
		FileUtils.rm "/tmp/test.txt"
	end
end