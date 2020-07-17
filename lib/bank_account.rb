require 'pry'
class BankAccount

    attr_accessor :balance, :status
    attr_reader :name
    def initialize(name, balance=1000, status='open')
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(balance)
        @balance += 1000
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            return true 
        else 
            false
        end
    end

    def close_account()
        @status = "closed"
    end
end


jim = BankAccount.new("jim", 1000, "open")
sam = BankAccount.new("sam", 0, "closed")