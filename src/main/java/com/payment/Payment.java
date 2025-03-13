package com.payment;

public class Payment {
	
		private int idpayment;
		private int pid;
		private String date;
		private double amount;
		private String payment_method;
		private String phone;
		
		
		
		public int getIdpayment() {
			return idpayment;
		}
		public void setIdpayment(int idpayment) {
			this.idpayment = idpayment;
		}
		
		public int getPid() {
			return pid;
		}
		public void setPid(int pid) {
			this.pid = pid;
		}
		
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		
		public double getAmount() {
			return amount;
		}
		public void setAmount(double amount) {
			this.amount = amount;
		}
		
		public String getPaymentMethod() {
			return payment_method;
		}
		public void setPaymentMethod(String payment_method) {
			this.payment_method = payment_method;
		}
		
	
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		
		
}

