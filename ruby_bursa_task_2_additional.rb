  def email_notification_params
    {
      name:    "#{@reader_with_book.name}",
      book:    "#{@reader_with_book.book_title}",
      author:  "#{@reader_with_book.book_author}",
      penalty_per_hour:  "#{@reader_with_book.book.fine()}",
      penalty:           "#{penalty()}",
      hours_to_deadline: "#{(@issue_datetime - DateTime.now.new_offset(0)).round * 24}"
    }
  end

  def email_notification
    <<-TEXT
      Hello, #{email_notification_params[:name]}!\n
      #{ if email_notification_params[:hours_to_deadline].to_i <= 0
            "You must return the book \"#{email_notification_params[:book]}\" authored by #{email_notification_params[:author]} as soon as possible!\n
      You already owe the library $#{sprintf('%.2f', email_notification_params[:penalty].to_f / 100.0)} (¢#{email_notification_params[:penalty]}) and you are charged ¢#{email_notification_params[:penalty_per_hour]} every hour.\n
      Your overdue for the moment is #{-email_notification_params[:hours_to_deadline].to_i} hours."
         else 
            "You should return the book \"#{email_notification_params[:book]}\" authored by #{email_notification_params[:author]} in #{email_notification_params[:hours_to_deadline]} hours.\n
      Otherwise you will be charged ¢#{email_notification_params[:penalty_per_hour]} per hour."
         end
      }
    TEXT
  end