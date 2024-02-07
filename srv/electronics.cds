using { com.satinfotech.electronics as db } from '../db/schema';

service ElectronicsDB {
    entity BusinessPartner as projection on db.BusinessPartner; 
    entity States as projection on db.States;
}

annotate ElectronicsDB.BusinessPartner with {
    Name @assert.format: '^[a-zA-Z ]{2,}$'; // Only alphabets and space, minimum length 2
    Address1 @assert.format: '^[a-zA-Z0-9\s,.-]+$';
    Address2 @assert.format: '^[a-zA-Z0-9\s,.-]+$';
    City @assert.format: '^[a-zA-Z ]{2,}$'; // Only alphabets and space, minimum length 2
    State @assert.format: '^[a-zA-Z]{2}$'; // Exactly 2 alphabets
    PINCode @assert.format: '^\d{6}$'; // Exactly 6 digits
    GSTINNumber @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}[0-9A-Z]{1}$'; // GSTIN format
}

annotate ElectronicsDB.Product with {
    ProductName @assert.format: '^[a-zA-Z0-9\s]+$'; // Only alphanumeric characters and spaces
    ProductImageURL @assert.format: '^(http|https)://[a-zA-Z0-9./\-_]+$'; // Valid URL format
    ProductCostPrice @assert.range.min: 0; // Minimum value is 0
    ProductSellPrice @assert.range.min: 0; // Minimum value is 0
};


annotate ElectronicsDB.States with @(
    UI.LineItem:[
        {
            Value: code
        },
        {
            Value: description
        }
    ],
     UI.FieldGroup #States : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value : code,
            },
            {
                Value : description,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StatesFacet',
            Label : 'States',
            Target : '@UI.FieldGroup#States',
        },
    ],

);

annotate ElectronicsDB.BusinessPartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : BusinessPartnerNumber
        },
        {
            $Type : 'UI.DataField',
            Label: 'Name',
            Value : Name
        },
        {
            $Type : 'UI.DataField',
            Value : Address1
        },
        {
            $Type : 'UI.DataField',
            Value : Address2
        },
        {
            $Type : 'UI.DataField',
            Value : City
        },
        {
            $Type : 'UI.DataField',
            Value : State
        },
        {
            $Type : 'UI.DataField',
            Value : PINCode
        },
        {
            $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
            $Type : 'UI.DataField',
            Value : GSTINNumber
        },
        {
            $Type : 'UI.DataField',
            Value : Is_vendor
        },
        {
            $Type : 'UI.DataField',
            Value: Is_customer
        }
    ],
    UI.SelectionFields: [ BusinessPartnerNumber, Name, City, State, PINCode],       
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BusinessPartnerNumber,
            },
            {
                $Type : 'UI.DataField',
                Label: 'Name',
                Value : Name
            },
            {
                $Type : 'UI.DataField',
                Value : Address1,
            },
            {
                $Type : 'UI.DataField',
                Value : Address2,
            },
            {
                $Type : 'UI.DataField',
                Value : City,
            },
            {
                $Type : 'UI.DataField',
                Value : State
            },
            {
                $Type : 'UI.DataField',
                Value : PINCode
            },
            {
                $Type : 'UI.DataField',
                Value : Is_gstn_registered
            },
            {
                $Type : 'UI.DataField',
                Value : GSTINNumber
            },
            {
                $Type : 'UI.DataField',
                Value : Is_vendor
            },
            {
                $Type : 'UI.DataField',
                Value: Is_customer
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'Business Partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        }
    ]
);