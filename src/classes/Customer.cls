/**
 * Author : Natic
 * Model Class : define model and it's behaviors
 */

public with sharing class Customer {
    public CustomerViewModel viewModel;

    public Customer(String contactId) {
        List<Contact> contacts = [SELECT Id, Name, Phone, Email FROM Contact WHERE Id = :contactId];
        viewModel = new CustomerViewModel();

        if (contacts != null && contacts.size() > 0) {
            viewModel.contactId = contacts[0].Id;
            viewModel.name      = contacts[0].Name;
            viewModel.email     = contacts[0].Email;
            viewModel.phone     = contacts[0].Phone;
            viewModel.success   = true;
        } else {
            viewModel.success = false;
            viewModel.messages.add('Contact not found!');
        }
    }

    public void getWebSite() {
        List<Contact> contacts = [SELECT
                                    Account.Website
                                  FROM Contact
                                  WHERE Id = :viewModel.contactId];
        if (contacts != null && contacts.size() > 0) {
            viewModel.website = contacts[0].Account.Website;
        }
    }

    public void calOpenCaseNumber() {
        List<Case> cases = [SELECT
                                Id
                            FROM Case
                            WHERE ContactId = :viewModel.contactId
                            AND Status != 'Closed'];
        viewModel.openCaseNumber = cases != null ? cases.size() : 0;
    }

    /**
        ViewModel : Build base on front end page structure
     */
    public class CustomerViewModel extends ViewModelAbstract {
        public String contactId;
        public String name;
        public String phone;
        public String email;

        public String  website;
        public Integer openCaseNumber;

    }
}