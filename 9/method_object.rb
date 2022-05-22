class A
  def initialize(name)
    @name = name
  end

  def self.hello
    :cls_method_hello
  end

  def hello(other_name, _hi = 'Hello', *_args)
    "Hello, #{other_name}. I'm #{@name}."
  end
end

a = A.new('Alice')
# Methodオブジェクトの作成
m = a.method(:hello)
p m

# 引数の数の取得
p m.arity

# 引数の情報の取得
p m.parameters

# メソッドの持ち主/名前/レシーバ
p m.owner
p A.method(:hello).owner # => #<Class:A>
p m.name
p m.receiver

class B < A
  def hello
    :overrided_method
  end
end

b = B.new('Bob')
mb = b.method(:hello)

# オーバーライドしたメソッドをえる
p mb
sm = mb.super_method
p sm
p m
p m.equal? sm
p [m.owner, m.name, m.receiver]
p [sm.owner, sm.name, sm.receiver]

# Unbound Methodを作る
uma1 = A.instance_method(:hello)
uma2 = m.unbind
p uma1, uma2
p uma1 == uma2

# 引数を調査する
p uma1.arity
p uma1.parameters
p uma1.name, uma1.owner
# p uma1.receiverはいない

# UnboundMethodからMethodオブジェクトを作成する
mm = uma1.bind a
p mm
p mm.call('jj')
p uma1.bind(b).call('jj')

# MethodオブジェクトをProcオブジェクトに変換する
pr = mm.to_proc
p pr.call('jj')

people = %i[Dave Eliza Fana]
m = a.method(:hello)
p people.map(&m.to_proc)

# Methodオブジェクトの使われ方
# - バージョンアップに伴うデフォルト動作の違いを考慮して、引数の違いを調べて互換性を保つ
# - インスタンス変数にメソッドオブジェクトを格納して、巻数オブジェクトのように扱う
