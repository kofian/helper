# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# . . .

User.delete_all
# . . 
User.create!(:first_name => 'Sonia', :last_name => 'Watson', 
:email => 'dommesonia@gmail.com', 
:password => 'hacker', :password_confirmation => 'hacker', 
:admin => true, :featured => true)

# . . .

Project.delete_all
# . . .
Project.create!(title: 'Saving Kelly',
description:
%{<p>
This boy named kelly was born with a hole in his heart. It looked his case was hopeless at first but the doctors said he can still have a normal life if a pulmonary bypass operation is performed on him before he turns 12yrs old.
</p>},
estimate: 40059.95,
user_id: nil, picture: nil, slug: "saving-kelly", 
contact_email: "yeh.ki@yah.com", state: "open",
url: "", review_tags: nil, 
start_date: "2016-10-20 09:08:08", end_date: "2016-02-11 01:16:00", 
custom_fields: nil, archived: false, 
opens_at: "2016-10-20 09:08:08", closes_at: "2016-01-11 01:51:00", 
featured: false, watch: true)

# . . .

Project.create!(title: 'The one homeless old guy', 
description: 'We research and document and publish several subjects. Most of the time it takes patience and articulated observation to make well informed policy decisions. This we at sasesa widely believe is our messianic mission to the people of the world and ourselves to make truths be known at all times in all places under the sun.The illuminating light of enlightenment shall forever shine on humanity.', 
estimate: 65303.54, user_id: nil, picture: '126036345__plixid.com_.jpg', 
slug: 'the-one-homeless-old-guy', contact_email: 'another-oild@guys.com', state: 'open', 
url: "", review_tags: nil, 
start_date: '2016-10-20 09:08:08', end_date: '2016-02-11 01:16:00', 
custom_fields: nil, archived: false, 
opens_at: '2016-10-20 09:08:08', closes_at: '2016-01-11 01:51:00', 
featured: true, watch: false)

#. . .
Project.create!(title: 'Cancer Kid',
description:
%{<p>
Can we help grant the last wish of Shakur. He is on the stage 4 cancer battle, though he is a warrior, but win some lose some. He will be leaving us soon but we can help make his last wish of climbing mountain everest a reality.
</p>},
estimate: 90000.95, user_id: nil, picture: "8721_gal.jpg", 
slug: 'cancer-kid', contact_email: 'canckid@yum.dom', state: 'open', 
url: "", review_tags: nil, 
start_date: '2016-10-20 09:08:08', end_date: '2016-02-11 01:16:00', 
custom_fields: nil, archived: false, 
opens_at: '2016-10-20 09:08:08', closes_at: '2016-01-11 01:51:00', 
featured: false, watch: true)
# . . .
Project.create!(title: 'Jules with HIV',
description:
 %{<p>
 This infant was born with HIV, the doctors said she has hope. She can be cured though her mother won't be with her for much longer but she have a chance of having a fulfilled life if we can help make that happen. Just a minor operation will save her and then we can hope to find a loving home for her.
 </p>},
estimate: 53672.95, user_id: nil, picture: '126036345__plixid.com_.jpg', 
slug: 'jules-with-hiv', contact_email: 'jules-with-hiv@aol.com', state: 'open', 
url: "", review_tags: nil, 
start_date: '2016-10-20 09:08:08', end_date: '2016-02-11 01:16:00', 
custom_fields: nil, archived: false, 
opens_at: '2016-10-20 09:08:08', closes_at: '2016-01-11 01:51:00', 
featured: false, watch: true)
#  . . .

