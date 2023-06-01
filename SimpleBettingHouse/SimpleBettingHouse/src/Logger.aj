import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import archivos.*;
import com.bettinghouse.BettingHouse;
import com.bettinghouse.Person;
import com.bettinghouse.User;

public aspect Logger {
	 String filepath="src/archivos/register.txt";
	 Calendar cal = Calendar.getInstance();
	 pointcut success(User u, Person p) : 
		 call(void com.bettinghouse.BettingHouse.successfulSignUp(User , Person )) && args(u,p);
	    
	    after(User u, Person p) :success(u, p) {
	    	
	    	try (BufferedWriter br=new BufferedWriter(new FileWriter(filepath,true))){
	              
	               br.write("Usuario registrado: "+"[ "+"nickname: "+u.getNickname()+" "+" password: "+u.getPassword()+" ]");
	               br.newLine(); // Agregar nueva línea al final
	               
	           } catch (IOException e) {
	               e.printStackTrace();
	           }
	    }
}