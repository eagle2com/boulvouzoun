use readline
import readline

import State, IdleState

LoginState: class extends State {
    
    askUser = 1, askPwd = 2 : static Int
    username := ""
    password := ""
    
    state := askUser
    
    init: func ~login (.shell) { super(shell) }
    
    run: func -> This {
        
        res : This = match(state) {
            
            case askUser =>
                buffer := readline("username: ")
                username = buffer clone()
                free(buffer)
                IdleState new(shell)
                
            // password not implemented yet
                
        }
        return res
        
    }
    
    reset: func {
    
        username = ""
        password = ""
        
    }
    
}
