require 'sshkit'
require 'sshkit/dsl'

module Remote
    @@message = ""

   SSHKit::Backend::Netssh.configure do |ssh|
       ssh.ssh_options = {
                           user: 'ubuntu',
                           auth_methods: ['publickey']
                         }
   end

  def self.run(command)
    on 'ubuntu@server.com' do
      as :ubuntu do
          @@message = execute(command)
      end
    end
  return @@message
  end

end
