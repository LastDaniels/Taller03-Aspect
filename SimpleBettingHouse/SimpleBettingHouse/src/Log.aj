import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.bettinghouse.*;
public aspect Log {
	String filepath="src/archivos/log.txt";
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MMMMM/yyyy hh:mm:ss ");
 pointcut session(User u):
	 call(void com.bettinghouse.BettingHouse.effectiveLog*(User )) && args(u);
 	after(User u) :session(u) {
 		
 	
 	//
            
            
        
        }
 
}
