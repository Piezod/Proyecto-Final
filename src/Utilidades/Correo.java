package Utilidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;

/*
 * Esta clase nos permitira enviar emails 
 */
public class Correo {
	
	public static String usuario="estudiantesconecta2@gmail.com"; // correo electronico
	public static String pass="salesianospizarrales"; // Contraseña del correo
	public static String Mensage=""; // Aqui ira el cuerpo del mensaje
	public static String to=""; // Direccion de a quien se lo mandamos
	public static String Subject=""; // Titulo del email.
	
	public Correo( String mensaje, String destinatario, String titulo)
	{
		Mensage=mensaje;
		to=destinatario;
		Subject=titulo;
	}
	public Correo()
	{
		
	}
	
	/*
	 * Este metodo nos enviara el email.
	 */
	public void SendMail() {
		
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
 
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(usuario, pass);
                    }
                });
 
        try {
 
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuario));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject(Subject);
            MimeBodyPart messageBodyPart = new MimeBodyPart();

            // Fill the message
            messageBodyPart.setText(Mensage,"UTF-8","html");

            //message.setText(Mensage);
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            // Put parts in message
            message.setContent(multipart);

 
            Transport.send(message);
 
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        
       
    }


		public void correoglobal(String mensaje,String titulo) throws SQLException, ClassNotFoundException
		{
			Conexion c=new Conexion();
			c.conectar();
			String query="select * from usuarios";
			
			
		    ResultSet r=c.sacarresultset(query);
				while(r.next())
				{
					
					Mensage=mensaje;
					Subject=titulo; 
					r.getString(1); //usuario
					r.getString(3); //nombre
					
					to=r.getString(7);  // email
					
					System.out.println("mensaje enviado a "+r.getString(1));  
					//SendMail();
					
				}
			c.cerrarconexion();
		}
		
		public void notificacioncurso(String mensaje,String titulo, String usuario) throws ClassNotFoundException, SQLException
		{
			Conexion c=new Conexion();
			c.conectar();
			String ciclo="select ciclo from usuarios where usuario like '"+usuario+"'";
			String curso="select curso from usuarios where usuario like '"+usuario+"'";
			
			ciclo=c.sacarundatostring(ciclo);
			curso=c.sacarundatostring(curso);
			
			
	String query="select * from usuarios where ciclo like '"+ciclo+"' and curso like '"+curso+"' and usuario not like '"+usuario+"'";
			
			
		    ResultSet r=c.sacarresultset(query);
				while(r.next())
				{
					
					Mensage=mensaje;
					Subject=titulo; 
					r.getString(1); //usuario
					r.getString(3); //nombre
					to=r.getString(7);  // email
					
					System.out.println("mensaje enviado a "+r.getString(1));  
					//SendMail();
					
				}
			
			c.cerrarconexion();
		
		
		}
}

