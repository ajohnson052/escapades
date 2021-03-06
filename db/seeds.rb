Escapade.destroy_all
User.destroy_all


for i in 1...10
  User.create(email: "user#{i}@domain.com", password: "qwerqwer", password_confirmation:"qwerqwer")
end

user1 = User.find_by(email: "user1@domain.com")

thailand = Escapade.create(title: "Thailand", start_date: "2016-01-01", end_date: "2016-05-01", description: "Truffaut trust fund brooklyn godard lo-fi hella, flexitarian stumptown offal food truck taxidermy jean shorts. Microdosing try-hard green juice aesthetic dreamcatcher. Pop-up quinoa hammock fap, banh mi shoreditch health goth small batch tattooed mustache hashtag selvage YOLO chambray letterpress. IPhone cliche heirloom, stumptown bicycle rights celiac green juice intelligentsia deep v VHS tote bag pork belly scenester yuccie mixtape. Shoreditch taxidermy bespoke franzen etsy offal vice. Put a bird on it cray kogi schlitz, bitters PBR&B polaroid tilde vinyl twee poutine DIY XOXO small batch. Cray forage wayfarers, occupy yuccie pitchfork pop-up vinyl swag pickled scenester tacos blog put a bird on it.", user_id: user1.id)

File.open("app/assets/images/thailand.jpg") do |image|
  thailand.image = image
end
thailand.save!

norway = Escapade.create(title: "Norwegian Adventure", start_date: "2016-02-01", end_date: "2016-03-01", description: "Butcher kinfolk craft beer tumblr seitan post-ironic. Tacos microdosing squid pour-over four loko, hella portland cronut humblebrag authentic kombucha migas. +1 XOXO YOLO banjo, green juice roof party umami. Butcher sustainable listicle meh, pabst leggings fap schlitz dreamcatcher mlkshk. Gastropub authentic chartreuse chicharrones, sriracha williamsburg salvia keytar 3 wolf moon brunch marfa mixtape kitsch fingerstache irony. Truffaut trust fund brooklyn godard lo-fi hella, flexitarian stumptown offal food truck taxidermy jean shorts. Microdosing try-hard green juice aesthetic dreamcatcher. Pop-up quinoa hammock fap, banh mi shoreditch health goth small batch tattooed mustache hashtag selvage YOLO chambray letterpress. IPhone cliche heirloom, stumptown bicycle rights celiac green juice intelligentsia deep v VHS tote bag pork belly scenester yuccie mixtape. Shoreditch taxidermy bespoke franzen etsy offal vice. Put a bird on it cray kogi schlitz, bitters PBR&B polaroid tilde vinyl twee poutine DIY XOXO small batch. Cray forage wayfarers, occupy yuccie pitchfork pop-up vinyl swag pickled scenester tacos blog put a bird on it.", user_id: user1.id)

File.open("app/assets/images/norway.jpg") do |image|
  norway.image = image
end
norway.save!
#
# Escapade.create(title: "Trapeze Class", image: "https://i.ytimg.com/vi/WIO-lxCyiDU/maxresdefault.jpg", start_date: "2015-12-01", end_date:"2015-12-31", description: "Intelligentsia distillery VHS sriracha tattooed, dreamcatcher echo park DIY next level pour-over normcore gentrify. Celiac PBR&B tacos seitan yr. Wayfarers kitsch health goth, tattooed gluten-free sustainable farm-to-table tote bag +1 90's art party. Tacos ramps farm-to-table selvage pickled XOXO williamsburg cred. Sartorial literally freegan bushwick chia roof party, gentrify sustainable chicharrones brooklyn. Salvia viral kombucha neutra, skateboard twee craft beer street art blue bottle. Health goth cred echo park pitchfork, chillwave cliche fingerstache lomo bespoke.", user_id: 1)
#
# Escapade.create(title: "The Wonder Exhibit", image: "http://media.npr.org/assets/img/2015/11/12/grade_middlefork_custom-a23c871f26659f6ab1a6ff2891a18ec445f47416-s800-c85.jpg", start_date: "2015-11-16", end_date: "2015-12-19", description: "In the Renwick's newly renovated gallery in Washington, D.C., nine artists were each given free rein over a space to create inspiring installations. Tara Donovan used hundreds of thousands of index cards to create a mountain range. Gabriel Dawe made a rainbow out of some 60 miles of colored thread. Patrick Dougherty turned sticks into giant, swirling nests.", user_id: 2)
#
# Escapade.create(title: "PATAGONIA", image: "http://www.hostalpatagonia.cl/wp-content/uploads/2011/10/Torres-del-Paine-Serrano-River-Chile.jpg", start_date: "2016-10-01", end_date: "2017-03-01", description: "Etsy retro tote bag swag. Tattooed cardigan plaid, tote bag iPhone flexitarian DIY skateboard before they sold out intelligentsia readymade. Church-key franzen scenester, lumbersexual hashtag next level quinoa literally tofu gentrify lomo trust fund art party selvage everyday carry. Ugh polaroid tumblr small batch hashtag, actually banh mi viral waistcoat DIY keffiyeh mumblecore butcher YOLO. Ugh swag celiac, cred pitchfork keffiyeh yr keytar intelligentsia actually fanny pack master cleanse. Skateboard franzen aesthetic pinterest beard. Heirloom polaroid biodiesel gentrify bespoke, four loko knausgaard aesthetic squid chambray.", user_id: 2)
#
# Escapade.create(title: "Taktsang Monastery", image: "https://arc300.files.wordpress.com/2011/07/paro-taktsang.jpg", start_date: "2016-02-01", end_date: "2016-12-31", description: "The Taktsang Monastery means the Tiger’s Nest. This monastery is the most important religious site for the Bhutanese people, and located at a distance of around 80 km from Paro, precariously perched on the edge of a cliff. This monastery has been built around the cave where Guru Rimpoche and later his follower Dubthak Singye meditated. It clings to a cliff of rock which is about 800 meters above the valley.", user_id: 3)
#
# Escapade.create(title: "Alaska!", image: "http://www.bestamazingplacesonearth.com/wp-content/uploads/2014/08/orcas-alaska7.jpg", start_date: "2016-05-01", end_date: "2015-09-30", description: "Etsy retro tote bag swag. Tattooed cardigan plaid, tote bag iPhone flexitarian DIY skateboard before they sold out intelligentsia readymade. Church-key franzen scenester, lumbersexual hashtag next level quinoa literally tofu gentrify lomo trust fund art party selvage everyday carry. Ugh polaroid tumblr small batch hashtag, actually banh mi viral waistcoat DIY keffiyeh mumblecore butcher YOLO. Ugh swag celiac, cred pitchfork keffiyeh yr keytar intelligentsia actually fanny pack master cleanse. Skateboard franzen aesthetic pinterest beard. Heirloom polaroid biodiesel gentrify bespoke, four loko knausgaard aesthetic squid chambray.", user_id: 3)
