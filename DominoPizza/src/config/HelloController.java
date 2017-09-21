package config;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping(value = { "/", "hello" }, method = RequestMethod.GET)
    public void hello(@RequestParam("addr") String addr, HttpServletResponse res) {
	StringBuilder sb = new StringBuilder();
	try {
	    URL ocu = new URL(
		    "http://maps.googleapis.com/maps/api/geocode/xml?language=ko&sensor=false&address="
			    + URLEncoder.encode(addr, "UTF-8"));
	    BufferedReader in = new BufferedReader(new InputStreamReader(
		    ocu.openStream()));

	    String line = null;
	    while ((line = in.readLine()) != null) {
		sb.append(line);
	    }
	    in.close();
	    
	    res.setContentType("text/xml;charset=UTF-8");
            res.getWriter().write(sb.toString());
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

}