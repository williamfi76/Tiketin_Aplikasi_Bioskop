from typing import List
from Model.member import Member
from Model.showing import Showing
from Model.ticket import Ticket
from Model.ticketStatus import TicketStatus
from Model.transaction import Transaction


class TransactionTicket(Transaction):
    def __init__(self, id, tickets:List[Ticket], member:Member = None, showing:Showing = None, ticketStatus:TicketStatus = TicketStatus.UNREDEEMED):
        nominal = showing.get_studio().get_pricePerSeat() * len(tickets)
        super().__init__(id, nominal, member.get_id())
        self.tickets:List[Ticket] = tickets
        self.ticketStatus:TicketStatus = ticketStatus
        self.showing = showing

    def get_showing(self):
        return self.showing

    def set_showing(self, value):
        self.showing = value
    
    def get_tickets(self):
        return self.tickets

    def set_tickets(self, tickets):
        self.tickets = tickets
    
    def get_ticketStatus(self):
        return self.ticketStatus
    
    def set_ticketStatus(self, status:TicketStatus):
        self.ticketStatus = status

