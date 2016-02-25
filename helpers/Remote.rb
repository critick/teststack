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

  def self.get_otp(number)
      on 'ubuntu@api-upgrad.com' do
        as :ubuntu do
            binding.pry
            @@message = DataBaseHelper.get_query("SELECT post_token from sms_logins where contact_number='#{number.to_i}' order by last_sms_sent_at desc limit 1","post_token")
        end
      end
    return @@message
  end

  def self.run(command)
    on 'ubuntu@api-upgrad.com' do
      as :ubuntu do
          @@message = execute(command)
      end
    end
  return @@message
  end

end
