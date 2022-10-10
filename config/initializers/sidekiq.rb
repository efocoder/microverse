Sidekiq.configure_client do |config|
  Rails.application.config.after_initialize do
    UsersWorker.perform_async(50)
  end
end