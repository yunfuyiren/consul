section "Creating DEMO Users" do
  User.create!(email: "verified@consul.dev",
               password: "12345678",
               username: "verified",
               gender: "male",
               date_of_birth: "25/08/1998",
               verified_at: "25/08/2019",
               confirmed_at: "25/08/2019",
               document_number: "12345678A",
               document_type: "1",
               residence_verified_at: "25/08/2019",
               confirmed_phone: "987654321",
               level_two_verified_at: "25/08/2019",
               email_on_comment: false,
               email_on_comment_reply: false,
               terms_of_service: "1")

  [
    "Judy Garrett",
    "Tiffany Castro",
    "Henry Hall",
    "Joe Sanders",
    "Johnny Ortiz",
    "Jason Kennedy",
    "Joan Wheeler",
    "Crystal Herrera",
    "Scott Boyd",
    "Doris Carroll"
  ].each_with_index do |name, i|
    User.create!(email: "user#{i + 1}@consul.dev",
                 password: "12345678",
                 username: name,
                 document_number: "0000000#{i}A",
                 document_type: "1",
                 date_of_birth: "25/08/1998".to_time,
                 verified_at: "25/08/2019".to_time,
                 confirmed_at: "25/08/2019".to_time,
                 terms_of_service: "1")
  end
end
