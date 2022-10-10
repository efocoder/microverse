module UserService
  class FetchLocalUserService < ApplicationService
    def initialize(limit: Constants::USERS_PER_PAGE , offset: 0, status_filter: 'All')
      @offest = get_page_number(offset) # Normal page starts from 0
      @limit = limit
      @status_filter = status_filter
    end

    def call
      fetch_local_users
    end


    private

    def fetch_local_users
      if @status_filter == 'All'
        User.offset(@offest * @limit).limit(@limit).order(:id)
      else
        User.where(status: @status_filter).offset(@offest * @limit).limit(@limit).order(:id)
      end
    end

    def get_page_number(page)
      page = Constants::DEFAULT_PAGE_NUMBER if page < Constants::DEFAULT_PAGE_NUMBER
      if page == Constants::DEFAULT_PAGE_NUMBER
        0
      else
        page - Constants::DEFAULT_PAGE_NUMBER
      end
    end
  end
end
