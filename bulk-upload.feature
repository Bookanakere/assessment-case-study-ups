Feature: Bulk Upload

Bulk upload functionality to update transport and delivery details for a given equipment

@BulkUpload @Regression 
Scenario Outline: Upload transport and delivery details for multiple equipments
Given I am present on the bulk upload page
And I have an excel sheet <DocName> with tranport details in the required format
When I upload the excel sheet
Then the transport details must be uploaded successfully

Examples:
  | DocName                        |  
  | 10Records_MultiEquip.xls       | 
  | 1000Records_MultiEquip.xls     | 

@BulkUpload @Regression 
Scenario Outline: Upload transport and delivery details for one single equipment
Given I am present on the bulk upload page
And I have an excel sheet <DocName> with tranport details in the required format
When I upload the excel sheet
Then the transport details must be uploaded successfully

Examples:
  | DocName                         | 
  | SingleRecord.xls                | 
  | 10Records_SingleEquip.xls       | 


@BulkUpload @Negative
Scenario: Unsuccessful attempt to upload transport and delivery details
Given I am present on the bulk upload page
And I have an invalid excel sheet with no records
When I upload the excel sheet
Then I must see an appropriate error message

@BulkUpload @Negative
Scenario: Unsuccessful attempt to upload transport and delivery details
Given I am present on the bulk upload page
And I have an invalid excel sheet with missing values for required fields
When I upload the excel sheet
Then I must see an appropriate error message

@BulkUpload @Negative
Scenario: Unsuccessful attempt to upload transport and delivery details
Given I am present on the bulk upload page
And I have an invalid excel sheet with incompatible transport types
When I upload the excel sheet
Then I must see an appropriate error message

@BulkUpload @Negative
Scenario: Unsuccessful attempt to upload transport and  delivery details
Given I am present on the bulk upload page
And I have an invalid excel sheet with incorrect values for fields with fixed values
When I upload the excel sheet
Then I must see an appropriate error message