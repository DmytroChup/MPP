# Створіть клас "Книга" з властивостями, такими як назва, автор і рік видання.
# Напишіть методи для отримання та встановлення цих властивостей.

class Book
  def title
    @title
  end

  def title=(title)
    @title = title
  end

  def author
    @author
  end

  def author=(author)
    @author = author
  end

  def publication_date
    @publication_date
  end

  def publication_date=(publication_date)
    @publication_date = publication_date
  end

  def print_info
    puts "#{@title}, #{@author}, #{@publication_date}"
  end
end

book = Book.new
book.title = "Hello"
book.author = "Dima"
book.publication_date = "01.02.2000"

book.print_info
