require 'rails_helper'

RSpec.describe UsersWorker, type: :worker do
  let (:worker) { UsersWorker.new }


  it "calls with both limit and offset" do
    users =  worker.perform(10, 2)
    expect(users.results.class).to eq Array
    expect(users.num_inserts).to eq 1

  end
end
