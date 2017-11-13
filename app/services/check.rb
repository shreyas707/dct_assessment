class Check

  attr_accessor :uid, :aid, :lang, :bid

  def initialize(uid,aid,lang,bid)
    self.uid = uid
    self.aid = aid
    self.lang = lang
    self.bid = bid
  end

  def has_cache
    # binding.pry
    @flag = Answer.where(user_id: self.uid, question_id: self.aid, language: self.lang,batch_set_id: self.bid)
    if @flag.empty?
      @con = {"statement"=> "default"}
      return @con
    else
      @con = @flag.first
    end
    return @con
  end

end