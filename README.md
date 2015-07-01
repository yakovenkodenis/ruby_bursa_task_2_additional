# The additional RubyBursa task 2
## `email_notification` method

### Usage:

```ruby
require_relative 'author'
require_relative 'book'
require_relative 'published_book'
require_relative 'reader'
require_relative 'reader_with_book'


author1 =  Author.new(1828, 1910, 'Leo Tolstoy' ) 
book    =  PublishedBook.new(author1, 'War and Peace', 1400, 3280, 1996)
reader  =  ReaderWithBook.new('Ivan Testenko', 16, book, 328)
manager =  LibraryManager.new(reader, (DateTime.now.new_offset(0) + 2.days))


puts manager.email_notification
```

### Output

* if the submission date is in 48 hours:

>      Hello, Ivan Testenko!
>
>      You should return the book "War and Peace" authored by Leo Tolstoy in 48 hours.
>
>      Otherwise you will be charged ¢16.24 per hour.


* if the submission date has expired two week ago

>      Hello, Ivan Testenko!
>
>      You must return the book "War and Peace" authored by Leo Tolstoy as soon as possible!
>
>      You already owe the library $54.57 (¢5457) and you are charged ¢16.24 every hour.
>
>      Your overdue for the moment is 336 hours.

