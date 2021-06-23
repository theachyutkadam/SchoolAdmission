require 'roo'

namespace :import do
  desc "Importing Districts from Excelsheet."
  task districts: :environment do
    path = "/Users/developer/Downloads/districts.xlsx"
    data = Roo::Spreadsheet.open(path)
    headers = data.row(1)
    data.each_with_index do |row, idx|
      districts_data = Hash[[headers, row].transpose]
      # next if idx == 0
      # next if idx == 1
      # next if idx == 2
      if idx >= 3
        name = districts_data['Name']
        if District.where(name: name).any?
          puts "#{name} district already present"
        else
          District.create(name: name, state_id: 1)
          # puts "new #{name} district created"
        end
      end
    end
    puts "-------------"
    puts District.count
    puts "-------------"
  end

end
