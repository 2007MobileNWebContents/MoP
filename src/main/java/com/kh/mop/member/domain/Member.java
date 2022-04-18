package com.kh.mop.member.domain;

import java.sql.Date;

public class Member {

   private String memberId;
   private String memberPwd;
   private String memberName;
   private String phone;
   private String email;
   private String accountNumber;
   private String zipCode;
   private String addr;
   private String bank;
   private int won;
   private String reservation;
   private Date joinDate;


   public Member() {}

   public Member(String memberId, String memberPwd) {
      super();
      this.memberId = memberId;
      this.memberPwd = memberPwd;
   }

   public Member(String memberId, String memberPwd, String memberName, String phone, String email,
         String accountNumber, String zipCode, String addr, String bank, int won, String reservation,
         Date joinDate) {
      super();
      this.memberId = memberId;
      this.memberPwd = memberPwd;
      this.memberName = memberName;
      this.phone = phone;
      this.email = email;
      this.accountNumber = accountNumber;
      this.zipCode = zipCode;
      this.addr = addr;
      this.bank = bank;
      this.won = won;
      this.reservation = reservation;
      this.joinDate = joinDate;
   }

   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }

   public String getMemberPwd() {
      return memberPwd;
   }

   public void setMemberPwd(String memberPwd) {
      this.memberPwd = memberPwd;
   }

   public String getMemberName() {
      return memberName;
   }

   public void setMemberName(String memberName) {
      this.memberName = memberName;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getAccountNumber() {
      return accountNumber;
   }

   public void setAccountNumber(String accountNumber) {
      this.accountNumber = accountNumber;
   }

   public String getZipCode() {
      return zipCode;
   }

   public void setZipCode(String zipCode) {
      this.zipCode = zipCode;
   }

   public String getAddr() {
      return addr;
   }

   public void setAddr(String addr) {
      this.addr = addr;
   }

   public String getBank() {
      return bank;
   }

   public void setBank(String bank) {
      this.bank = bank;
   }

   public int getWon() {
      return won;
   }

   public void setWon(int won) {
      this.won = won;
   }

   public String getReservation() {
      return reservation;
   }

   public void setReservation(String reservation) {
      this.reservation = reservation;
   }

   public Date getJoinDate() {
      return joinDate;
   }

   public void setJoinDate(Date joinDate) {
      this.joinDate = joinDate;
   }

   @Override
   public String toString() {
      return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", phone="
            + phone + ", email=" + email + ", accountNumber=" + accountNumber + ", zipCode=" + zipCode + ", addr="
            + addr + ", bank=" + bank + ", won=" + won + ", reservation=" + reservation + ", joinDate=" + joinDate
            + "]";
   }

}