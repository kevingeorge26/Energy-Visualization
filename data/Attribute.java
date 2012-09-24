
public enum Attribute
{
	ENERGY_PRODUCTION("Total Energy Production","Total Energy\nProduction","in QUADS * 10"),
	ENERGY_CONSUMPTION("Total Energy Consumption","Total Energy\nConsumption", "in QUADS * 10"),
	ENERGY_CONSUMPTION_CAPITA("Total Energy Consumption per Capita","Total Energy\nConsumption\nper Capita","in MMBtu"),
	CO2_EMISSION("Total CO2 Emission","Total\nCO2\nEmission","in MMT"),
	CO2_EMISSION_CAPITA("Total CO2 Emission per Capita","Total CO2\nEmission\nper Capita","in MT"),
	ELECTRICTY_GENERATION("Total Electricity Genaration","Total Electricity\nGenaration", " in BkWH"),	
	ENERGY_PRODUCTION_CAPITA("Total Energy Production per Capita","Total Energy\nProduction\nper Capita","in MMBtu"),
	ELECTRICTY_GENERATION_CAPITA("Electricity Genaration per capita", "Total Elec generation\nper Capita","in kWH");

	String label,axis,unit;
	
	private Attribute(String label,String axis,String unit)
	{
		this.label = label;
		this.axis = axis;
		this.unit = unit;
	}
	
	public String getLabel()
	{
		return label;
	}

	public String getAxisLabel() {
		return axis;
	}
	
	public String getUnit() {
		return unit;
	}
}
