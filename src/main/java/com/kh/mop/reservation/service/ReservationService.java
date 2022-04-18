package com.kh.mop.reservation.service;

import java.util.ArrayList;

import com.kh.mop.reservation.domain.Reservation;

public interface ReservationService {

	public ArrayList<Reservation>resertvationList();
	public int insertReservation(Reservation reservation);
	public int deleteReservation(int rId);
	
}
