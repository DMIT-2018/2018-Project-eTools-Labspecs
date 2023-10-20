<Query Kind="Program">
  <Connection>
    <ID>3e7989fd-850b-4647-8d4b-918d73b2ea96</ID>
    <NamingServiceVersion>2</NamingServiceVersion>
    <Persist>true</Persist>
    <Server>.</Server>
    <AllowDateOnlyTimeOnly>true</AllowDateOnlyTimeOnly>
    <DeferDatabasePopulation>true</DeferDatabasePopulation>
    <Database>OLTP-DMIT2018</Database>
    <DriverData>
      <LegacyMFA>false</LegacyMFA>
    </DriverData>
  </Connection>
</Query>

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