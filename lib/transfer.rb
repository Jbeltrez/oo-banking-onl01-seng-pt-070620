class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver= receiver
    @status= "pending"
    @amount= amount
  end
  def valid?
    @sender.valid? && @receiver.valid? 
  end
  def execute_transaction 
    if self.status != "complete"
    sender.balance = sender.balance - amount
    receiver.balance = receiver.balance + amount
    self.status = "complete"
    end
    if not (sender.valid? && receiver.valid?)
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
    # if @sender.balance > amount && self.status == "pending"
    #   @amount && @status == "pending"
    #   @sender.balance -= @amount 
    #   @receiver.balance += @amount 
    #   @status = "complete" 
    # elsif !sender.valid?
    #   @status= "rejected"
    #   "Transaction rejected. Please check your account balance."
    # end 
  # end && sender.balance > amount && self.status == "pending"
  #     @sender.balance -= @amount 
  #     @receiver.balance += @amount 
  #     @status = "complete"
  #   else
  #     @status = "rejected"
  #   end 
  #   #for some reason all the above code fails the test where each transfer can only happen once 
    
  end
  def reverse_transfer 
    if self.status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount 
    
      self.status = "reversed"
    else 
      nil  
    end
    

  end 

  # your code here
end
