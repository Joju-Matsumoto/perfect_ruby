# fronzen-string-literal: true

# あいさつをするクラス
class Poke
  # 読者が格納される
  attr_accessor :reader

  # 著者名が格納される
  attr_accessor :authors

  #
  # このクラスのバージョン
  #
  VERSION = '0.0.1'

  # @param [String] user_name 読者の名前
  # @return [Poke] Pokeインスタンス
  def initialize(user_name = 'you')
    @reader = user_name
    @authors = %w[joju python ruby golang]
  end

  # @param [String] name 挨拶する人の名前
  # @return [String]　英語のあいさつ
  def english(name = @reader)
    "Hello #{name}"
  end
end
