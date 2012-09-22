import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;


public class Atlas 
{

	private static String years[] = new String[30];
	private static 	HashMap<String, Country> countries = new HashMap<String, Country>();

	private static void loadYears(String strLine)
	{
		String[] temp = strLine.split(";");
		int i = 0;

		for( int j = 0 ; j < temp.length ; j++ )
		{
			if(temp[j].trim().compareTo("") == 0)
			{

			}
			else
			{
				years[i] = temp[j].trim();
				i++;
			}
		}
		
	}



	public Atlas()
	{		
		loadEnergyProduction();
		

		
		
	}

	public String[] getEnergyProduction(String countryName)
	{
		return ((Country)countries.get(countryName)).getEnergyConsumption();
	}


	private void loadEnergyProduction()
	{
		try
		{
			int i = 1;
			FileInputStream fstream = new FileInputStream("Total_Energy_Production.csv");
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));

			String strLine;
			String years[];

			while ((strLine = br.readLine()) != null)
			{
				// all the countries are after row 5
				if( i >= 5)
				{
					String[] row = strLine.split(";");

					if( !countries.containsKey(row[0].toLowerCase()) )
					{
						Country country = new Country(row[0].toLowerCase());
						countries.put(row[0].toLowerCase(), country);
					}

					Country country = countries.get(row[0].toLowerCase());
					country.loadEnergyConsumption(row);


				}

				// getting the year for the column
				if( i == 3)
				{
					loadYears(strLine);
				}



				i++;
			}

			in.close();
		}
		catch (Exception e)
		{
			System.err.println("Error: " + e.getMessage());
		}
	}



	public static String[] getCountrySuggestions(String toSearch)
	{
		Set<String> country  = countries.keySet();
		List<String> suggestions = new ArrayList<String>();

		for( String temp : country)
		{
			if(temp.startsWith(toSearch))
			{
				suggestions.add(temp);
				
			}
		}

		return suggestions.toArray(new String[suggestions.size()]);
	}
}



