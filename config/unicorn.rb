@application_path = File.expand_path('../..', __FILE__);
@shared_path = File.expand_path('../shared', @application_path);
@shared_path = @application_path unless Dir.exist? @shared_path

worker_processes 2
working_directory @application_path

timeout 30
preload_app true

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "#{@shared_path}/sockets/unicorn.socket", :backlog => 64

# Set process id path
pid "#{@shared_path}/pids/unicorn.pid"
# Set log file paths
stderr_path "#{@shared_path}/log/unicorn.stderr.log"
stdout_path "#{@shared_path}/log/unicorn.stdout.log"

check_client_connection false

before_fork do |server, worker|
=begin
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
=end
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

end

after_fork do |server, worker|
=begin
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
=end
end