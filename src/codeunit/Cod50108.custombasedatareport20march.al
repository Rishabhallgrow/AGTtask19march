codeunit 50108 custombasedatareport20march
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstitutereport(ReportId: Integer; var newreportid: Integer)
    begin
        if ReportId = Report::"Standard Purchase - Order" then begin
            newreportid := Report::"AGTrepo20march";
        end;
    end;
}
