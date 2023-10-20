public class WorkingVersionsView
{
	public int VersionId { get; set; }
	public int Major { get; set; }
	public int Minor { get; set; }
	public int Build { get; set; }
	public int Revision { get; set; }
	public System.DateTime AsOfDate { get; set; }
	public string Comments { get; set; }
}