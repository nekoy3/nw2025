class Person
  #attr_writer :age #Public的な
  def initialize name, age
    @name = name
    @age = age
  end

  def info
    @name + "," + @age.to_s
  end
end

p = Person.new "neko", 20
#puts Person.age
puts p.info