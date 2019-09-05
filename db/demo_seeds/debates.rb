section "Creating DEMO Debates" do

  author = User.find_by_email "admin@consul.dev"

  debate = Debate.create!(author: author,
                          title: "#YouAsk: Julio Airroa, city council expert on environmental pollution",
                          description: "<p>Glad to answer your questions about city pollution.</p>\r\n\r\n<p>\r\nI introduce myself first. I have a PhD in Industrial Engineering from the Polytechnic University. Professor of Environmental Engineering at the School of Industrial Engineers of the Polytechnic University. Deputy Director of Academic Planning at the School of Industrial Engineers. National representative in the Geneva Convention working group on modelling and integral assessment of air quality. Co-author of 28 books and 40 articles in international journals. Participant in more than forty national and international congresses or workshops, in 33 competitive projects and more than 30 projects with private organizations.</p>\r\n\r\n<p>\r\nYou can leave your questions about the environment, pollution or air quality.</p>\r\n\r\n<p>\r\nOn Wednesday at 18:00 h. I will come in to answer them.</p>\r\n\r\n<p></p>\r\n\r\n<p></p>\r\n",
                          tag_list: "youask,pollution,environment",
                          terms_of_service: "1",
                          created_at: "27/08/2019")

  up_voters = users.sample(6)
  up_voters.each do |voter|
    debate.vote_by(voter: voter, vote: true)
  end

  comment = debate.comments.create!(body: "Can light pollution be considered as a type of pollution? thank you very much.",
                                    user_id: 3,
                                    created_at: "27/08/2019 10:25:42")
  up_voters = users.sample(4)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 10:25:42")

  comment = debate.comments.create!(body: "How is pollution measured in the city? Are the sensors really distributed in a representative way?",
                                    user_id: 4,
                                    created_at: "27/08/2019 12:13:19")
  up_voters = users.sample(4)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 12:13:19")

  comment = debate.comments.create!(body: "What measures are being taken in other cities similar to ours?",
                                    user_id: 5,
                                    created_at: "27/08/2019 14:34:07")
  voters = users.sample(3)
  up_voters = voters.first(1)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(2)
  down_voters.each do |voter|
    comment.vote_by(voter: voter, vote: false)
  end
  comment.update(updated_at: "27/08/2019 14:34:07")

  comment = debate.comments.create!(body: "I would like to know if the closure of the city centre to private traffic would have a major impact on pollution or not so relevant?",
                                    user_id: 6,
                                    created_at: "27/08/2019 15:51:21")
  up_voters = users.sample(5)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 15:51:21")

  comment = debate.comments.create!(body: "According with this study of the city university it would have an impact around the 40%: https://goog.gl/dfX45dds",
                                    user_id: author.id,
                                    ancestry: Comment.last.id,
                                    created_at: "27/08/2019 21:04:35",
                                    updated_at: "27/08/2019 21:04:35")

  debate.update(updated_at: "27/08/2019 21:04:35")

  debate = Debate.create!(author: author,
                          title: "Would it be okay if the city surrounded itself with a green belt by the highway?",
                          description: "<p>One of the most powerful CO2 sinks and pollution filter are forests and trees. Surrounding ourselves with autochthonous vegetation by taking advantage of the margins and slopes of the ring roads would be a good way to counteract the emissions produced on these roads. It would give more environmental quality to the city and mitigate heat waves, landscape restoration, among other benefits.</p>\r\n\r\n<p>However, there are people who think that this is too expensive and it would be better to look for other ways to reduce pollution. What do you think?</p>\r\n\r\n<p></p>\r\n",
                          tag_list: "environment,transport,trees",
                          terms_of_service: "1",
                          created_at: "27/08/2019")

  up_voters = users.sample(7)
  up_voters.each do |voter|
    debate.vote_by(voter: voter, vote: true)
  end

  comment = debate.comments.create!(body: "This sounds too expensive. What other proposals could be thought but much cheaper?",
                                    user_id: 8,
                                    created_at: "27/08/2019 18:27:02")
  up_voters = users.sample(3)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 18:27:02")

  comment = debate.comments.create!(body: "It's a perfect idea. It would create a natural retaining wall of pollution",
                                    user_id: 9,
                                    created_at: "27/08/2019 09:38:52")
  up_voters = users.sample(5)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 09:38:52")

  comment = debate.comments.create!(body: "But what will be the real effect?",
                                    user_id: 5,
                                    ancestry: Comment.last.id,
                                    created_at: "27/08/2019 15:51:21")
  down_voters = users.sample(5)
  down_voters.each do |voter|
    comment.vote_by(voter: voter, vote: false)
  end
  comment.update(updated_at: "27/08/2019 15:51:21")

  debate.update(updated_at: "27/08/2019 18:27:02")

  debate = Debate.create!(author: author,
                          title: "Public sources, benches and shadows.",
                          description: "<p>The streets and squares of the city have become hard: only cement, without fountains, benches or shadows. It is supposed to facilitate maintenance, but in reality the only important impact is the increase in consumption in large establishments by seeking refuge in them and the use of public spaces with terraces, promotional events, etc...</p>\r\n\r\n<p>\r\nHow could we solve this question? Do you think it benefits the city?</p>\r\n\r\n<p>\r\nFor example, it occurs to me that it would be good to create a network of drinking water fountains and install more benches and shadows in all the streets and squares. This would stimulate sport, pedestrianism and social exchange.</p>\r\n\r\n<p>\r\nWhat do you think?</p>\r\n",
                          tag_list: "urbanism,fountains,benches,squares",
                          terms_of_service: "1",
                          created_at: "27/08/2019")

  voters = users.sample(4)
  up_voters = voters.first(3)
  up_voters.each do |voter|
    debate.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(1)
  down_voters.each do |voter|
    debate.vote_by(voter: voter, vote: false)
  end

  comment = debate.comments.create!(body: "The good thing about cement squares is that they make it possible to create punctual installations, for example for cultural or leisure purposes. I think it would be appropriate to prioritize this type of facilities rather than just the terraces of bars or establishments.",
                                    user_id: 7,
                                    created_at: "27/08/2019 14:34:07")
  voters = users.sample(5)
  up_voters = voters.first(2)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(3)
  down_voters.each do |voter|
    comment.vote_by(voter: voter, vote: false)
  end
  comment.update(updated_at: "27/08/2019 14:34:07")

  debate.update(updated_at: "27/08/2019 14:34:07")

  debate = Debate.create!(author: author,
                          title: "Rental prices",
                          description: "<p>Over the last couple of years, the weight of rents has increased dramatically, although the number of tourists walking around the city has also increased.</p>\r\n\r\n<p>It is sometimes proposed that not only is there a correlation, but that the type of tourist rental is the root cause of the former. But it is difficult to find data to prove the claim.</p>\r\n\r\n<p>Does anyone have sufficiently comprehensive sources of information on this issue to resolve it?</p>\r\n\r\n<p></p>\r\n",
                          tag_list: "urbanism,housing,regulation,price",
                          terms_of_service: "1",
                          created_at: "27/08/2019")

  voters = users.sample(5)
  up_voters = voters.first(4)
  up_voters.each do |voter|
    debate.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(1)
  down_voters.each do |voter|
    debate.vote_by(voter: voter, vote: false)
  end

  comment = debate.comments.create!(body: "I believe that tourist rental is positive, provided that it is not monopolised and is carried out in a decentralised manner and on a small scale.",
                                    user_id: 3,
                                    created_at: "27/08/2019 09:38:52")
  up_voters = users.sample(5)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 09:38:52")

  comment = debate.comments.create!(body: "I totally agree. It would be necessary to limit the maximum tenancy of apartments per person.",
                                    user_id: 4,
                                    ancestry: Comment.last.id,
                                    created_at: "27/08/2019 15:51:21")
  voters = users.sample(3)
  up_voters = voters.first(1)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(2)
  down_voters.each do |voter|
    comment.vote_by(voter: voter, vote: false)
  end
  comment.update(updated_at: "27/08/2019 15:51:21")

  debate.update(updated_at: "27/08/2019 15:51:21")

  debate = Debate.create!(author: author,
                          title: "Metro at night (on weekends). Is it positive?",
                          description: "<p>This is a debate that has been going on for a long time and it is the possibility of opening the metro on weekends at night. It would be important to know if it is a positive measure or too expensive for what it reports to the city.</p>\r\n\r\n<p>We do not need too high a frequency, but we do not need more than 20 minutes, because if we had to change trains, it would drive many people back. It would be interesting,</p>\r\n\r\n<p>if someone knows a little more about the subject, to know the cons that this would have, because I believe that currently, there is no metro in the world that is open at night, so I do not think it is an easy task. </p>\r\n",
                          tag_list: "urbanism,transport,metro",
                          terms_of_service: "1",
                          created_at: "27/08/2019")

  voters = users.sample(6)
  up_voters = voters.first(5)
  up_voters.each do |voter|
    debate.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(1)
  down_voters.each do |voter|
    debate.vote_by(voter: voter, vote: false)
  end

  comment = debate.comments.create!(body: "No, it would be better a network of night buses",
                                    user_id: 12,
                                    created_at: "27/08/2019 09:38:52")
  up_voters = users.sample(3)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 09:38:52")

  comment = debate.comments.create!(body: "It would be necessary to study the frequency of displacements at night. It is not clear to me that the number of people is relevant.",
                                    user_id: 11,
                                    created_at: "27/08/2019 14:34:07")
  voters = users.sample(4)
  up_voters = voters.first(3)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  down_voters = voters.last(1)
  down_voters.each do |voter|
    comment.vote_by(voter: voter, vote: false)
  end
  comment.update(updated_at: "27/08/2019 14:34:07")

  comment = debate.comments.create!(body: "How could that number be known?",
                                    user_id: 10,
                                    ancestry: Comment.last.id,
                                    created_at: "27/08/2019 18:27:02")
  up_voters = users.sample(3)
  up_voters.each do |voter|
    comment.vote_by(voter: voter, vote: true)
  end
  comment.update(updated_at: "27/08/2019 18:27:02")

  debate.update(updated_at: "27/08/2019 18:27:02")
end
