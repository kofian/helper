class CombinePledgesInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|

    #count the number of each project in the cart
      sums = cart.pledges.group(:project_id).sum(:interval)
    
      sums.each do |project_id, interval, amount|
        if interval > 1
         #remove individual pledge
         cart.pledges.where(project_id: project_id).delete_all
    
         #Replace with a single pledge
         item = cart.pledges.build(project_id: project_id)
         item.interval = interval
         item.amount = amount
         item.save!
        end
      end
    end
  end

  def down
     #split pledges with intervals > 1 into multiple pledges
     Pledge.where("interval>1").each do |pledge|
       #add individual pledges
       pledge.interval.times do
        Pledge.create cart_id: pledge.cart_id,
        project_id: pledge.project_id, interval: 1, amount: 5
       end
      #remove original item
      pledge.destroy
     end

  end
end
