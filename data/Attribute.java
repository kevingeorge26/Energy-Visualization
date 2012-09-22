
public enum Attribute
{
	ENERGY_PRODUCTION("Total Energy Production","Total Energy\nProduction"),
	ENERGY_CONSUMPTION("Total Energy Consumption","Total Energy\nConsumption"),
	ENERGY_CONSUMPTION_CAPITA("Total Energy Consumption per Capita","Total Energy\nConsumption\nper Capita"),
	CO2_EMISSION("Total CO2 Emission","Total\nCO2\nEmission"),
	CO2_EMISSION_CAPITA("Total CO2 Emission per Capita","Total CO2\nEmission\nper Capita"),
	ELECTRICTY_GENERATION("Total Electricity Genaration","Total Electricity\nGenaration");

	String label,axis;
	
	private Attribute(String label,String axis)
	{
		this.label = label;
		this.axis = axis;
	}
	
	public String getLabel()
	{
		return label;
	}

	public String getAxisLabel() {
		return axis;
	}
	
}
