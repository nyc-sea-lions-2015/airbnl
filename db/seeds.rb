sam = {:first_name => "Samantha", :last_name => "Guergenenov", :age => 24, :language => "french, english, spanish", :description => "I am a very relaxed girl, who is outgoing and willing to show you Paris around and teach you french! If you like pets and longboarding, it is a plus!", :email => "sam@gmail.com", :password => "123123", :password_confirmation => "123123", :photo_url => "http://samguergen.github.io/imgs/me.png", :facebook_url => "https://www.facebook.com/desgensetrangescesamericains"}

jack = {:first_name => "Jack", :last_name => "LHeureux", :age => 27, :language => "french", :description => "Cool guy, outgoing and fun, love nature and pets", :email=> "jack@gmail.com", :password => "234234", :password_confirmation => "234234", :photo_url => "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/8/005/012/3b0/315ee1e.jpg", :facebook_url => "https://www.facebook.com/jack.lheureux.9?fref=ts" }

sammy = User.create!(sam)
jacky= User.create!(jack)

post1 = {:title => "My humble abode", :location => "avenue de Segur, Paris, France 75007", :start_date => "2015-04-08", :end_date => "2015-04-30", :price => 60, :description => "Very cozy appartment in a beautiful neighborhood. Breakfast provided!", :photo_url => "http://cdn.parisperfect.com/photos/apartments/large_1055055973-1270881789-minervois-paris-apartment-living%20room.jpg", :user_id => sammy.id}

post2 = {:title => "My chill basement", :location => "Portland, Maine, USA", :start_date => "2015-05-01", :end_date => "2015-05-15", :price => 30, :description => "Cool basement, you have your own bathroom and we even allow pets", :photo_url => "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSPPLSKrsH5jRAO2zilUzLKP6v1exKh97Fa4uslKQZa_RrICHH8", :user_id => jacky.id}

post_1 = Post.create!(post1)
post_2 = Post.create!(post2)

comment1 = {:description => "Wah! Very nice. I am interested!", :post_id => post_1.id , :user_id => jacky.id}

comment2 = {:description => "I like it.", :post_id => post_2.id , :user_id => sammy.id}

comment_1 = Comment.create!(comment1)
comment_2 = Comment.create!(comment2)