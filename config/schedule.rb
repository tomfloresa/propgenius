every 2.minutes do
  runner "Subunit.notify_when_thirty_to_end_lease", :environment => 'production'
  runner "Subunit.notify_when_fifteen_to_end_lease", :environment => 'production'
  runner "Subunit.notify_when_five_to_end_lease", :environment => 'production'
  runner "Subunit.notify_when_one_to_end_lease", :environment => 'production'
end
