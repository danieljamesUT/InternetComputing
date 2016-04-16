package internetcomputing;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/* A lot of this is based on StackOverflow answer: http://stackoverflow.com/questions/13109898/how-to-set-up-the-servlet-path-make-html-correctly-invoke-servlet-file */


/**
 * Servlet implementation class MyServlet
 */
@WebServlet(description = "test servlet", urlPatterns = { "/InternetComputingServlet" })
public class InternetComputingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InternetComputingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//        String info = request.getParameter("info") ;  
        String name = request.getParameter("myname");
        String email = request.getParameter("email");
        PrintWriter out = response.getWriter() ;
        out.println("<html>") ;
        out.println("<head><title>Hello Servlet</title></head>") ;
        out.println("<body>") ;
        out.println("<h1> Your name: " + name + "</h1>") ;
        out.println("<h3> Your email: " + email + "</h3>") ;
        out.println("</body>") ;
        out.println("</html>") ;
        out.close() ;

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
           this.doGet(request, response);
    }


}