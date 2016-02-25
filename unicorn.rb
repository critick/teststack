# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
@dir = "./lib/viewer/public"

rack_root = "#{@dir}"
#worker_processes 2
#working_directory @dir

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
#listen "#{@dir}/tmp/sockets/unicorn.sock", :backlog => 64

# Unicorn socket
#listen "/tmp/unicorn.[viewer].sock"
#listen "/tmp/unicorn.viewer.sock"

# Set process id path
#pid "tmp/pids/unicorn.pid"

# Set log file paths
#stderr_path "#{@dir}log/unicorn.stderr.log"
#stdout_path "#{@dir}log/unicorn.stdout.log"
