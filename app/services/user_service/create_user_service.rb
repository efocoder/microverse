require 'ostruct'

module UserService
  class CreateUserService < ApplicationService
    def initialize(user_arr: nil)
      @users = user_arr
      @cleaned_data = []
      @current_users = User.all
    end


    def call
      create_user
    end

    private

    def create_user
      clean_data(@users)
      unless @cleaned_data.nil?
        User.transaction do
          User.import(@cleaned_data)
        end
      end
    end

    def clean_data(users)
      users.each do |user|
        unless @current_users.any? {|usr| usr.email === user['email'] }
          @cleaned_data << user
        end
      end
    end

    def dot_syntax_on_hash(arr)
      new_arr = []
      arr.each do |a|
        new_arr << OpenStruct.new(a)
      end
      new_arr
    end
  end
end
