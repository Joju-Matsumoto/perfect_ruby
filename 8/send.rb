class A
  private

  def hello
    :hello
  end
end

p A.new.send(:hello)
