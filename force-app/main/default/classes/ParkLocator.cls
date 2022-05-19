public class ParkLocator {
	public static List<String> country(string country){
	ParkService.ParksImplPort parkservice=
		new ParkService.ParksImplPort();
        return parkservice.bycountry(country);
}
}