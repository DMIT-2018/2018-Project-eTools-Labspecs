# Calling an existing ViewModel from your LINQ code
</br>
To make use of your the view models that you have created, you can use the #load method of LINQPad to reference it.  The advantage of this is you only need to code your view models once.  

## This is a LINQ C# Program file: "GetWorkingVesion.linq"

```csharp
//  load all C# files found in the current working directory.
#load ".\*.cs"

void Main()
{
GetWorkingVersion().Dump();
}

public WorkingVersionsView GetWorkingVersion()
{
	return WorkingVersions
			.Select(x => new WorkingVersionsView
			{
				VersionId = x.VersionId,
				Major = x.Major,
				Minor = x.Minor,
				Build = x.Build,
				Revision = x.Revision,
				AsOfDate = x.AsOfDate,
				Comments = x.Comments
			}
			).FirstOrDefault();
}
```

## This is your view model: "WorkingVesionView.cs"
```csharp
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
```
