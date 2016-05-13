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

   #SSHKit.config.output_verbosity = :debug

  def self.get_token_from_number(number)
      on 'ubuntu@server.com' do
        as :ubuntu do
            @@message = DataBaseHelper.get_query("SELECT token from table where number='#{number.to_i}' limit 1","post_token")
        end
      end
    return @@message
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
