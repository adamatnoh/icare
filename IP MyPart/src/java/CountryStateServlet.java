
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCountryStateservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            CountryStateDao csd = new CountryStateDao(DBCon.getCon());
            
            String op = request.getParameter("operation");
            
            if (op.equals("country")) {
                List<Country> clist = csd.getAllCountry();
                Gson json = new Gson();
                String countryList = json.toJson(clist);
                response.setContentType("text/html");
                response.getWriter().write(countryList);
            }

            if (op.equals("state")) {
                int id = Integer.parseInt(request.getParameter("id"));
                List<State> slist = csd.getStateByCountryId(id);
                Gson json = new Gson();
                String countryList = json.toJson(slist);
                response.setContentType("text/html");
                response.getWriter().write(countryList);
            }

            if (op.equals("city")) {
                int id = Integer.parseInt(request.getParameter("id"));
                List<City> citylist = csd.getCityByStateId(id);
                Gson json = new Gson();
                String countryList = json.toJson(citylist);
                response.setContentType("text/html");
                response.getWriter().write(countryList);
            }
        }
    }
}