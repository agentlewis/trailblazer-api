workers Integer(ENV['PUMA_WORKERS'] || 3)
threads Integer(ENV['PUMA_MIN_THREADS'] || 8), Integer(ENV['PUMA_MAX_THREADS'] || 12)

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do

  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
      Rails.application.config.database_configuration[Rails.env]

    config['pool'] = ENV['PUMA_MAX_THREADS'] || 12

    ActiveRecord::Base.establish_connection(config)
  end

end
