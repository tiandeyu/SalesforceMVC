/**
 * Author : Natic
 * Controller : Build and assembly model
 */

public with sharing class CustomerController {
    @RemoteAction
    public static ViewModelAbstract getContactById(String contactId) {
        Customer customer = new Customer(contactId);
        customer.getWebSite();
        customer.calOpenCaseNumber();
        return customer.viewModel;
    }
}