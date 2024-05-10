using RiskService as service from '../../srv/risk-service';

annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Title}',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'owner',
                Value: owner,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Priocode}',
                Value: prio_code,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Description}',
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Impact}',
                Value: impact,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Criticality}',
                Value: criticality,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>PrioCriticality}',
                Value: PrioCriticality,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Overview',
            ID    : 'RiskOverview',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Label : 'Basic Fields',
                ID    : 'BasicFields',
                Target: '@UI.FieldGroup#BasicFields',
            }, ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation',
            ID    : 'Mitigation',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Label : 'Mitigation Info',
                ID    : 'MitigationFields',
                Target: '@UI.FieldGroup#MitigationFields',
            }]
        }

    ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Title}',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Owner}',
            Value: owner,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Priocode}',
            Value: prio_code,
            Criticality: PrioCriticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Mitigation',
            Value: miti.descr,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Impact}',
            Value: impact,
            Criticality: criticality,
            CriticalityRepresentation: #WithIcon
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : 'Business partner',
            ![@UI.Importance] : #High,
        }
    ],
);

annotate service.Risks with {
    miti @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Mitigations',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: miti_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'descr',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'owner',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'timeline',
            },
        ],
    }
};

annotate service.Risks with @(UI.SelectionFields: [prio_code, ]);

annotate service.Risks with {
    prio @Common.Label: '{i18n>Priocode}'
};

annotate service.Risks with @(UI.HeaderInfo: {
    Title         : {
        $Type: 'UI.DataField',
        Value: title,
    },
    TypeName      : '',
    TypeNamePlural: '',
    Description   : {
        $Type: 'UI.DataField',
        Value: descr,
    },
    TypeImageUrl  : 'sap-icon://alert',
});

annotate service.Risks with @(UI.FieldGroup #MitigationFields: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: miti_ID,
            Label: 'ID'
        },
        {
            $Type: 'UI.DataField',
            Value: miti.descr,
            Label: 'Description'
        },
        {
            $Type: 'UI.DataField',
            Value: miti.timeline,
            Label: 'Timeline'
        },
        {
            $Type: 'UI.DataField',
            Value: miti.owner,
            Label: 'Owner'
        }
    ]
});

annotate service.Risks with @(UI.FieldGroup #BasicFields: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: title,
            Label: 'Title',
        },
        {
            $Type: 'UI.DataField',
            Value: owner,
            Label: 'Owner',
        },
        {
            $Type: 'UI.DataField',
            Value: descr,
            Label: 'Description',
        },
        {
            $Type: 'UI.DataField',
            Label: 'Priority',
            Value: prio_code,
        },
        {
            $Type: 'UI.DataField',
            Value: impact,
            Label: 'Impact',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact1',
            Label : 'Contact Name',
        },
    ],
});

annotate service.Risks with {
    prio @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
