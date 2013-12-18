require "evil-chef/version"
require "chef"

module EvilChef
	class Runner
		def initialize
		    ::Chef::Config[:solo] = true
		    @chef_client = ::Chef::Client.new
		    @chef_client.run_ohai
		    @chef_client.load_node
		    @chef_client.build_node
		end

		def init_run_context
		    run_context = if @chef_client.events.nil?
		                    ::Chef::RunContext.new(@chef_client.node, {})
		                  else
		                    ::Chef::RunContext.new(@chef_client.node, {}, @chef_client.events)
		                  end
		end

		def recipe_eval(&block)
			run_context = init_run_context
			recipe = ::Chef::Recipe.new("(evil-chef cookbook)", "(evil-chef recipe)", run_context)
			recipe.instance_eval(&block)
			runner = ::Chef::Runner.new(run_context)
			begin
				runner.converge
			rescue Exception => e
				@chef_client.run_status.exception = e
			end
			@chef_client.run_status
		end

		def node
			@chef_client.node
		end
	end
end
