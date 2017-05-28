require 'csv'

task :remake, [:param] => :environment do |task, args| 
  final = {}
  r_arr = CSV.read("region.csv").map{|e| e.join(".").split(";")}
  next_region = ""
  r_arr.each do |row|
    if row[0] != "" && row[1] == ""
      final[row[0]] = row[2].to_f
    elsif row[0] == ""
      final[next_region] ||= []
      final[next_region] = final[next_region] << {row[1] => row[2].to_f}
    else
      next_region = row[0]
      final[next_region] ||= []
      final[next_region] = final[next_region] << {row[1] => row[2].to_f}
    end
  end
  puts final.inspect
end



