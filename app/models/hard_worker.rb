class HardWorker
  include Sidekiq::Worker

  def perform(count)
    count.times do |number|
      Role.create(name: "sidekiq#{number}")
    end
  end
end