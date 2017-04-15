/**
 * Author : Natic
 * Define basic RemoteAction response structure
 */

global abstract class ViewModelAbstract {
    global boolean      success;
    global List<String> messages;

    global ViewModelAbstract() {
        this.messages = new List<String>();
    }
}