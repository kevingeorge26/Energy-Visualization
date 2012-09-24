import java.util.HashMap;

import controlP5.CColor;


public class Country
{


	String name;
	
	float[] energy_production = new float[30];
	float[] energy_consumption = new float[30];
	float[] energy_consumption_capita = new float[30];
	float[] co2 = new float[30];
	float[] co2_capita = new float[30];
	float[] electricty = new float[30];
	

	Country(String name)
	{
		this.name = name;
	}	

	public void loadEnergyProduction(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			energy_production[i-2] = getFloatValue(row[i].trim()) * 10;
		}
	}
	
	public void loadEnergyConsumption(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			energy_consumption[i-2] = getFloatValue(row[i].trim()) * 10;
		}
	}
	
	public void loadenergyConsumptionPercapita(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			energy_consumption_capita[i-2] = getFloatValue(row[i].trim());
		}
	}
	
	public  void loadco2(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			co2[i-2] = getFloatValue(row[i].trim());
		}
	}
	
	public  void loadco2capita(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			co2_capita[i-2] = getFloatValue(row[i].trim());
		}
	}
	
	public  void loadelec(String[] row)
	{
		for(int i = 2 ; i < row.length ; i++ )
		{
			electricty[i-2] = getFloatValue(row[i].trim()) *10;
		}
	}
	
	public float[] getAttributeValue(int startYear,int endYear,Attribute attr)
	{
		int start = startYear % 1980;
		int end = endYear % 1980;
		
		float[] toReturn = new float[end-start+1];
		int track = 0;
		
		float[] attrValue = getCorrectAttribute(attr);
		
		for(int i = start ; i <= end ; i++ )
			toReturn[track++] = attrValue[i];
		
		return toReturn;
	}
	
	public float getSum(int startYear, int endYear , Attribute attr)
	{
		int start = startYear % 1980;
		int end = endYear % 1980;
		
		float[] attrValue = getCorrectAttribute(attr);
		float sum = 0;
		
		for(int i = start ; i <= end ; i++ )
			sum += attrValue[i];
		
		return sum;
	}
	
	private float[] getCorrectAttribute(Attribute attr)
	{
		if(Attribute.ENERGY_PRODUCTION == attr)
		{
			return energy_production;
		}
		else if(Attribute.ENERGY_CONSUMPTION == attr)
		{
			return energy_consumption;
		}
		
		else if(Attribute.ENERGY_CONSUMPTION_CAPITA == attr)
		{
			return energy_consumption_capita;
		}		
		
		else if(Attribute.CO2_EMISSION == attr)
		{
			return co2;
		}
		
		else if(Attribute.CO2_EMISSION_CAPITA == attr)
		{
			return co2_capita;
		}
		
		else if(Attribute.ELECTRICTY_GENERATION == attr)
		{
			return electricty;
		}
		
		else
		{
			System.out.println("ERROR CHECK COUNTRY CLASS");
			return null;
		}
	}

	private static float getFloatValue(String toCheck)
	{
		float toReturn;
		try  
		{  
			toReturn = Float.parseFloat(toCheck);  
			return toReturn;  
		}  
		catch( Exception e)  
		{  
			
			return 0;  
		}  
	}

}
