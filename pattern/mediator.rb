class Mediator
  def send(message, colleague)
    raise NotImplementedError, "Subclasses must implement this method"
  end
end

class ConcreteMediator < Mediator
  attr_accessor :colleague1, :colleague2

  def send(message, colleague)
    if colleague == @colleague1
      @colleague2.notify(message)
    else
      @colleague1.notify(message)
    end
  end
end

class Colleague
  attr_reader :mediator

  def initialize(mediator)
    @mediator = mediator
  end
end

class ConcreteColleague1 < Colleague
  def send(message)
    @mediator.send(message, self)
  end

  def notify(message)
    puts "Colleague1 gets message: #{message}"
  end
end

class ConcreteColleague2 < Colleague
  def send(message)
    @mediator.send(message, self)
  end

  def notify(message)
    puts "Colleague2 gets message: #{message}"
  end
end

m = ConcreteMediator.new
c1 = ConcreteColleague1.new(m)
c2 = ConcreteColleague2.new(m)
m.colleague1 = c1
m.colleague2 = c2
c1.send('How are you?')
c2.send('Fine, thanks')