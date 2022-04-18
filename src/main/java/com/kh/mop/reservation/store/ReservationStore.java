package com.kh.mop.reservation.store;

import java.util.ArrayList;

import com.kh.mop.reservation.domain.Reservation;

public interface ReservationStore {

	public ArrayList<Reservation>resertvationList();
	public int insertReservation(Reservation reservation);
	public int deleteReservation(int rId);
}
