require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :transfer
  def initialize(sender, receiver, status="pending", transfer)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @transfer = transfer
  end
  def amount()
      @transfer
  end
  def valid?()
      if @sender == "pending" && @receiver == "pending"
          return false
      else
          true
      end
      @sender.valid?
      @receiver.valid?
  end
  def execute_transaction()
      #@sender - @receiver = @balance
      if @status == "complete"
        return
      end
      if @sender.balance < @transfer || @sender.status == "closed" || @status == "rejected" || @receiver.status == "closed"
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
      @sender.balance -= @transfer
      @receiver.balance += @transfer
      @status = "complete"
  end
  
  def reverse_transfer

    if @status == "complete" 
      @receiver.balance -= @transfer
      @sender.balance += @transfer
      @status = "reversed"
    end
  end
end

