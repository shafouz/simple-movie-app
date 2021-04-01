require 'rails_helper'

RSpec.describe SearchSaverJob, type: :job do
  describe "#perform_later" do
    it "saves records" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SearchSaverJob.perform_later("abc")
      }.to have_enqueued_job
    end
  end
end
