every 1.day, :at => '21:15' do
  runner "Subunit.notify_when_thirty_to_end_lease"
  runner "Subunit.notify_when_fifteen_to_end_lease"
  runner "Subunit.notify_when_five_to_end_lease"
  runner "Subunit.notify_when_one_to_end_lease"
end
