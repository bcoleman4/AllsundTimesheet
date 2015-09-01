# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def charts
    
    db = SQLite3::Database.open( "db/development.sqlite3" ) 
    report_clients = db.execute( "select name from clients" )
    report_employee = db.execute( "select name from employees")
    emp_count = db.execute("select count(*) from employees")
    client_count = db.execute("select count(*) from clients")
    emp_count1 = emp_count.fetch(0)
    @emp_count2 = emp_count1.fetch(0)
    client_count1 = client_count.fetch(0)
    @client_count2 = client_count1.fetch(0)
    @report_time = []
    @total_time_array = []
    ecount = 1
    ccount = 1
    @emp_count2.times do 
      @client_count2.times do
        @report_time.push db.execute("select printf('%.1f', count(*))/2 from timesheets as C JOIN activities
                                    AS R on C.activity_id=R.id
                                    where R.client_id = #{ccount} and C.employee_id = #{ecount}")
  
        ccount = ccount+1
        end
        @report_time.flatten!
        @total_time_array << @report_time
        @report_time = []
      ecount = ecount+1
      ccount = 1
    end
    @chart4 = LazyHighCharts::HighChart.new('column') do |f|
      f.options[:xAxis][:categories] = report_clients
      count = 0
      @emp_count2.times do  
        f.series(:name=>report_employee[count],:data=> @total_time_array[count])
        count = count+1
      end
      f.title({ :text=>"Total Time"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"absolute"}})
    end

    render "charts" , layout: "application"
  end
end
