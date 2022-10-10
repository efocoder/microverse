class UsersWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(limit = nil, offset=nil )
    UserService::FetchRemoteUserService.call(limit: limit, offset: offset)
  end
end
