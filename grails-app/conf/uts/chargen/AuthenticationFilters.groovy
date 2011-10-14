package uts.chargen

class AuthenticationFilters {
	def openidService

    def filters = {
        authentication(controller:'builder', action:'anmelden', invert: true) {
            before = {/*
				if(openidService.isNotLoggedIn(session)) {
					flash.error = 'Bitte melden Sie sich an'
					redirect(controller: "builder", action: "anmelden")
					return false
					
				} else if(!session['user']) {
					def user = User.findByOpenid(openidService.getIdentifier(session))
					if(!user) user = new User(openid: openidService.getIdentifier(session), admin: false)
					session['user'] = user
				}*/
			}
        }
    }
    
}
