import java.util.HashMap;


public class Country
{
	

	String name;
	String[] energy_consumption = new String[30];
		
	Country(String name)
	{
		this.name = name;
	}	
	
	public void loadEnergyConsumption(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			energy_consumption[i-2] = row[i];
		}
	}
	
	public String[] getEnergyConsumption()
	{
		return energy_consumption;
	}
	
}