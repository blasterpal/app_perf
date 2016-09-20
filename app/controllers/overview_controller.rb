class OverviewController < ApplicationController

  before_action :set_range

  def show
    @hosts = @current_application.hosts
    @transactions = @current_application
      .transaction_endpoints
      .joins(:transaction_sample_data)
      .group("transaction_endpoints.id")
      .having("COUNT(transaction_sample_data.id) > 0")

    @time_consuming_transactions = @current_application
      .transaction_endpoints
      .select("transaction_endpoints.*, SUM(transaction_data.call_count * transaction_data.duration) AS total_time_spent")
      .where(:transaction_data => { :timestamp => @range })
      .joins(:transaction_data)
      .group("transaction_endpoints.id")
      .order("SUM(transaction_data.call_count * transaction_data.duration) DESC")
    @total_time_spent = @time_consuming_transactions.map(&:total_time_spent).sum

    @traces = TransactionSampleDatum.where("trace_id is not null").limit(5)
  end

  private

  def set_range
    @range = (Time.now - 10.minutes)..Time.now
  end
end