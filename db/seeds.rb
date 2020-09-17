3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
    )
end

puts "3 topics created."

10.times do |blog|
    Blog.create!(
        title: "My Blogpost No.#{blog}",
        body: "This is a test post. #{blog}",
        topic_id: Topic.last.id
    )
end

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 2
    )
end

puts "5 skills created."

8.times do|p|
    Portfolio.create!(
        title: "Portfolio title #{p}",
        subtitle: "This is my great service.",
        body: "Good good, this is good.",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    )
end

1.times do|p|
    Portfolio.create!(
        title: "React js",
        subtitle: "This is my portfolio by React",
        body: "Good good, this is good.",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    )
end

puts "9 portfolio items created"

3.times do |tech|
    # Technology.create!(
    #     name: "Technology #{tech}",
    #     portfolio_id: Portfolio.last.id
    # )
    Portfolio.last.technologies.create!(
        name: "Technology #{tech}"
    )
end

puts "3 technologies created"