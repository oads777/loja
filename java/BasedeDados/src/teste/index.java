package teste;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.io.InputStream;
import java.io.File;
import java.nio.file.Files;
import java.net.InetSocketAddress;

public class index {
    public static void main(String[] args) throws IOException {
    	int port = 8083;
        HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
        
        server.createContext("/", new MyHandler());
        
        server.start();
        System.out.println("Servidor iniciado na porta: "+ port);
    }
    
    static class MyHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            exchange.sendResponseHeaders(200, 0);

            OutputStream os = exchange.getResponseBody();

            String filePath = new File("C:\\Users\\sirfa\\eclipse-workspace\\BasedeDados\\public\\index.html").getAbsolutePath();
            

            File file = new File(filePath);
            if (file.exists() && file.isFile()) {
                byte[] fileBytes = Files.readAllBytes(file.toPath());

                os.write(fileBytes);
            } else {
                String errorMessage = "Arquivo HTML não encontrado";
                System.out.println("Diretório de Execução: " + System.getProperty("user.dir"));
                os.write(errorMessage.getBytes());
            }
            
            os.close();
            
        }
        
    }
    
}