import java.util.HashSet;
import java.util.Set;


public class Kevin
{
	Set<String> selectedRegions = new HashSet<String>();
	
	public Kevin() 
	{
		Atlas atlas = new Atlas();
	}
	
	public void addCountry(String toAdd)
	{
		selectedRegions.add(toAdd);
	}
	
	public void removeCountry(String toRemove)
	{
		selectedRegions.remove(toRemove);
	}
	
	public String[] getCountry()
	{
		return selectedRegions.toArray(new String[selectedRegions.size()]);
	}

}
