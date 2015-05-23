desc "Start the server."
task :server do
  port = "3000"
  host = "0.0.0.0"

  puts "Start server: http://#{host}:#{port}/"
  start_server_cmd = "bundle exec shotgun --server=thin --host=#{host} config.ru -p #{port}"

  sh start_server_cmd
end