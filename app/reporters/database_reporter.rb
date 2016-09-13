class DatabaseReporter < Reporter

  def render
    view_context.area_chart(report_data, report_options)
  end

  def report_data
    application
      .database_calls
      .includes(:database_samples)
      .group("database_calls.name")
      .group_by_period(*report_params)
      .sum("transaction_sample_data.exclusive_duration")
  end

  private

  def report_options
    {
      :id => "database_chart",
      :height => "100%",
      :library => {
        :legend => {
          :position => "bottom"
        },
        :animation => false,
        :xAxis => {
          :plotLines => [],
          :type => 'datetime',
          :dateTimeLabelFormats => {
            :hour => '%I %p',
            :minute => '%I:%M %p'
          }
        },
        :plotOptions => {
          :area => {
            :stacking => "normal"
          }
        }
      }
    }
  end
end