package com.sushant.live.dto;

public class DashboardUtilities {
	
	 int totalOrders;
	 int totalVehicales;
	 int activeOrders;
	 int pendingOrders;
	 int completeOrders;
	 int billedTreeps;
	 int unbilledTreeps;
	 int diesel;
	 int totalDivers;
	public int getTotalOrders() {
		return totalOrders;
	}
	public void setTotalOrders(int totalOrders) {
		this.totalOrders = totalOrders;
	}
	public int getTotalVehicales() {
		return totalVehicales;
	}
	public void setTotalVehicales(int totalVehicales) {
		this.totalVehicales = totalVehicales;
	}
	public int getActiveOrders() {
		return activeOrders;
	}
	public void setActiveOrders(int activeOrders) {
		this.activeOrders = activeOrders;
	}
	public int getPendingOrders() {
		return pendingOrders;
	}
	public void setPendingOrders(int pendingOrders) {
		this.pendingOrders = pendingOrders;
	}
	public int getBilledTreeps() {
		return billedTreeps;
	}
	public void setBilledTreeps(int billedTreeps) {
		this.billedTreeps = billedTreeps;
	}
	public int getUnbilledTreeps() {
		return unbilledTreeps;
	}
	public void setUnbilledTreeps(int unbilledTreeps) {
		this.unbilledTreeps = unbilledTreeps;
	}
	public int getDiesel() {
		return diesel;
	}
	public void setDiesel(int diesel) {
		this.diesel = diesel;
	}
	public int getTotalDivers() {
		return totalDivers;
	}
	public void setTotalDivers(int totalDivers) {
		this.totalDivers = totalDivers;
	}
	
	public int getCompleteOrders() {
		return completeOrders;
	}
	public void setCompleteOrders(int completeOrders) {
		this.completeOrders = completeOrders;
	}
	public DashboardUtilities() {
		super();
	}
	public DashboardUtilities(int totalOrders, int totalVehicales, int activeOrders, int pendingOrders,
			int completeOrders, int billedTreeps, int unbilledTreeps, int diesel, int totalDivers) {
		super();
		this.totalOrders = totalOrders;
		this.totalVehicales = totalVehicales;
		this.activeOrders = activeOrders;
		this.pendingOrders = pendingOrders;
		this.completeOrders = completeOrders;
		this.billedTreeps = billedTreeps;
		this.unbilledTreeps = unbilledTreeps;
		this.diesel = diesel;
		this.totalDivers = totalDivers;
	}
	 
	 

	
}
