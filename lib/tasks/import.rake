require 'csv'
namespace :import do 

  desc 'Import matric results from csv file'
  task marks: :environment do
    filename = File.join Rails.root,"matric_Results_2016.csv"
    CSV.foreach(filename) do |row|
      emis, centre_no, name, wrote_2014, passed_2014, wrote_2015, passed_2015, wrote_2016, passed_2016, passrate2014, passrate2015, passrate2016, average = row
      Result.create(emis: emis, centre_no: centre_no, name: name, wrote_2014: wrote_2014, passed_2014: passed_2014, wrote_2015: wrote_2015, passed_2015: passed_2015, wrote_2016: wrote_2016, passed_2016: passed_2016, passrate2014: passrate2014, passrate2015: passrate2015, passrate2016: passrate2016, average: average)
    end

  

end
  
end