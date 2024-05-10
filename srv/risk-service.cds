using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk'
service RiskService @(requires: 'authenticated-user') {
    entity Risks            as projection on rm.Risks;
    annotate Risks with @odata.draft.enabled;
    annotate Risks with @(restrict: [
        {
            grant: 'READ',
            to   : 'RiskViewer'
        },
        {
            grant: [
                'READ',
                'WRITE',
                'UPDATE',
                'UPSERT',
                'DELETE'
            ],
            to   : 'RiskManager'
        }
    ]);

    entity Mitigations      as projection on rm.Mitigations;
    annotate Mitigations with @odata.draft.enabled;

    annotate Mitigations with @(restrict: [
        {
            grant: 'READ',
            to   : 'RiskViewer'
        },
        {
            grant: '*',
            to   : 'RiskManager'
        }
    ]);

    @readonly
    entity BusinessPartners as projection on rm.BusinessPartners;
}
