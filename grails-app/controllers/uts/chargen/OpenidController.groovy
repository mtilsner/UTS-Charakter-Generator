package uts.chargen

import org.openid4java.consumer.ConsumerManager
import org.openid4java.discovery.DiscoveryInformation
import org.openid4java.message.AuthRequest
import org.openid4java.message.ParameterList
import org.openid4java.consumer.VerificationResult
import org.openid4java.discovery.Identifier

class OpenidController {

	public ConsumerManager manager = new ConsumerManager();

	def anmelden = { }

    def sendRequest = {
		def _returnURL = "${createLink(controller: "openid", action: "receiveRequest", absolute: true)}"
	
		List discoveries = manager.discover(params["identifier"]);

	    // attempt to associate with the OpenID provider
	    // and retrieve one service endpoint for authentication
	    DiscoveryInformation discovered = manager.associate(discoveries);

	    // store the discovery information in the user's session for later use
	    // leave out for stateless operation / if there is no session
	    session["discovered"] = discovered;

	    // obtain a AuthRequest message to be sent to the OpenID provider
	    AuthRequest authReq = manager.authenticate(discovered, _returnURL);	
		redirect(url: authReq.getDestinationUrl(true))	
	}
	
	def receiveRequest = {
		// extract the parameters from the authentication response
	    // (which comes in as a HTTP request from the OpenID provider)
	    ParameterList openidResp = new ParameterList(request.getParameterMap());

	    // retrieve the previously stored discovery information
	    DiscoveryInformation discovered = (DiscoveryInformation) session["discovered"];

	    // extract the receiving URL from the HTTP request
	   // StringBuffer receivingURL = request.getRequestURL();
		StringBuffer receivingURL = request.request.requestURL
	    String queryString = request.getQueryString();
	    if (queryString != null && queryString.length() > 0)
	        receivingURL.append("?").append(request.getQueryString());

	    // verify the response
	    VerificationResult verification = manager.verify(receivingURL.toString(), openidResp, discovered);

	    // examine the verification result and extract the verified identifier
	    Identifier verified = verification.getVerifiedId();

	    if (verified != null) {
			def user = User.findByOpenid(verified.toString())
			if(!user) user = new User(openid: verified.toString(), admin: false)
			session['user'] = user
			redirect(controller: "builder", action: "index")
	    } else {
			session.flash = "Unable to Log In"
			redirect(controller: "builder", action: "anmelden")
		}
	}
}
