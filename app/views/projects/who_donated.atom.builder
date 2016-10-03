atom_feed do |feed|
  feed.title "Who supported #{@project.title}"
  feed.updated @latest_donation.try(:updated_at)
  
  @project.donations.each do |donation|
   feed.entry(donation) do |entry|
     entry.title "Donation #{donation.id}"
     entry.summary type: 'xhtml' do |xhtml|
      xhtml.p "Sent gratitude to #{donation.address}"
      xhtml.table do
       xhtml.tr do
        xhtml.th 'Project'
        xhtml.th 'Interval'
        xhtml.th 'Total Amount'
       end
       donation.pledges.each do |pledge|
        xhtml.tr do
         xhtml.td pledge.project.title
         xhtml.td pledge.interval
         xhtml.td number_to_currency pledge.amount
        end
       end
       xhtml.tr do
        xhtml.th 'total', colspan: 2
        xhtml.th number_to_currency \
        donation.pledges.map(&:amount).sum
       end
      end
      xhtml.p "Donated by #{donation.pay_type}"
     end
     entry.author do |author|
      author.name donation.name
      author.email donation.email
     end
    end
   end
end
