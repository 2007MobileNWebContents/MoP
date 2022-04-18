package com.kh.mop.reservation.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.reservation.domain.Reservation;
import com.kh.mop.reservation.store.ReservationStore;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationStore rStore;

	@Override
	public ArrayList<Reservation> resertvationList() {
		return rStore.resertvationList();
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return rStore.insertReservation(reservation);
	}

	@Override
	public int deleteReservation(int rId) {
		return rStore.deleteReservation(rId);
	}

}
