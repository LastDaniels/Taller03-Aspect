import java.io.BufferedWriter
import java.io.IOException;
import java.util.Calendar;

import com.bettinghouse.BettingHouse;
import com.bettinghouse.Person;
import com.bettinghouse.User;

public aspect Logger {
	
	 Calendar cal = Calendar.getInstance();
	 pointcut success(User u, Person p) : call(* BettingHousesuccessfulSignUp(User, Person))) && args(u) && args(p);
	    
	    after(User u, Person p) : success(u, p) {
	    	try (FileWriter fileWriter = new FileWriter(filePath, true);
	                BufferedWriter bufferedWriter = new BufferedWriter(fileWriter)) {
	               // Aquí puedes escribir en el archivo
	               bufferedWriter.write("Texto a escribir al final de la línea");
	               bufferedWriter.newLine(); // Agregar nueva línea al final
	           } catch (IOException e) {
	               e.printStackTrace();
	           }
	    }
}