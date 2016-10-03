# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Project.delete_all
# . . .
Project.create!(title: 'Saving Kelly',
description:
%{<p>
This boy named kelly was born with a hole in his heart. It looked his case was hopeless at first but the doctors said he can still have a normal life if a pulmonary bypass operation is performed on him before he turns 12yrs old.
</p>},
image_url: 'kelly.jpg',
estimate: 40059.95)
# . . .
Project.create!(title: 'Cancer Kid',
description:
%{<p>
Can we help grant the last wish of Shakur. He is on the stage 4 cancer battle, though he is a warrior, but win some lose some. He will be leaving us soon but we can help make his last wish of climbing mountain everest a reality.
</p>},
image_url: 'everest.jpg',
estimate: 90000.95)
# . . .
Project.create!(title: 'Jules with HIV',
description:
 %{<p>
 This infant was born with HIV, the doctors said she has hope. She can be cured though her mother won't be with her for much longer but she have a chance of having a fulfilled life if we can help make that happen. Just a minor operation will save her and then we can hope to find a loving home for her.
 </p>},
image_url: 'jules.jpg',
estimate: 53672.95)
#  . . .

