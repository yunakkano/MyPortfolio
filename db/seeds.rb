10.times do |blog|
    Blog.create!(
        title: "My Blogpost No.#{blog}",
        body: "This is a test post. #{blog}"
    )
end

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 2
    )
end

puts "5 skills created."

9.times do|p|
    Portfolio.create!(
        title: "Portfolio title #{p}",
        subtitle: "This is my great service.",
        body: "Good good, this is good.",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    )
end

puts "9 portfolio items created"