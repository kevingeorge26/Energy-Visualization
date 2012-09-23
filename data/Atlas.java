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
		loadEnergyConsumption();		
		loadEnergyConsumptionPerCapita();
		loadco2();
		loadco2capita();
		loadElec();
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
					country.loadEnergyProduction(row);
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
	
	
	
	
	private void loadEnergyConsumption()
	{
		try
		{
			int i = 1;
			FileInputStream fstream = new FileInputStream("Total_Energy_Consumption.csv");
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

				i++;
			}

			in.close();
		}
		catch (Exception e)
		{
			System.err.println("Error: " + e.getMessage());
		}
	}
	
	
	
	// New code starts here
	
	private void loadEnergyConsumptionPerCapita()
	{
		try
		{
			int i = 1;
			FileInputStream fstream = new FileInputStream("Primary_Energy_Consumption_per_Capita.csv");
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
					country.loadenergyConsumptionPercapita(row);
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

	private void loadco2()
	{
		try
		{
			int i = 1;
			FileInputStream fstream = new FileInputStream("co2_Emissions.csv");
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
					country.loadco2(row);
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
	

	private void loadco2capita()
	{
		try
		{
			int i = 1;
			FileInputStream fstream = new FileInputStream("co2_Emission_capita.csv");
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
					country.loadco2capita(row);
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
	


	private void loadElec()
	{
		try
		{
			int i = 1;
			FileInputStream fstream = new FileInputStream("Electricity.csv");
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
					country.loadelec(row);
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



	
	// New code ends here
	
	
	
	
	
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
	
	
	public float getBiggestValue(Set<String> country,int startYear,int endYear,Attribute attr1,Attribute attr2)
	{
		float max=0;
		
		if(attr1 != null)
		{
			for(String shit : country)
			{
				float[] values = countries.get(shit).getAttributeValue(startYear, endYear, attr1);
				
				for(int i = 0 ; i < values.length ; i++)
				{
					if( max < values[i])
						max = values[i];
				}
			}
		}
		
		
		if(attr2 != null)
		{
			for(String shit : country)
			{
				float[] values = countries.get(shit).getAttributeValue(startYear, endYear, attr2);
				
				for(int i = 0 ; i < values.length ; i++)
				{
					if( max < values[i])
						max = values[i];
				}
			}
		}
		
		return max;
	}
	
	public float[] getAttrValue(String country,int startYear,int endYear, Attribute attr)
	{
		return countries.get(country).getAttributeValue(startYear, endYear, attr);
	}
	
	
	
	// for pie chart
	
	public int[] getPercentage(Set<String> countries , int startYear,int endYear,Attribute attr )
	{
		float[] toStore = new float[countries.size()];
		int track = 0;
		
		for(String country :  countries )
		{
			toStore[track] = Atlas.countries.get(country).getSum(startYear, endYear, attr);
			track++;
		}
		
		float total = Atlas.countries.get("world").getSum(startYear, endYear, attr);
		
		
		int[] percent = new int[toStore.length+1];
		track = 0;
		
		for(int i = 0 ; i < toStore.length ; i++ )
		{
			percent[i] = (int) Math.ceil( (toStore[i]/total) * 100 );
			track += percent[i];
		}
		
		percent[toStore.length] = 360-track;
		return percent;
		
		
	}
	
	


	
}



