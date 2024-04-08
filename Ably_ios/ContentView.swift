import SwiftUI
import Ably

class AblyHelper: NSObject, ObservableObject {
    private(set) var realtime: ARTRealtime!
    
    override init() {
        let options = ARTClientOptions(key: "")
        options.logLevel = .debug
        options.clientId = "cocoa"
        //options.environment = "us-east-2-a"
        self.realtime = ARTRealtime(options: options)
        
        let channel = realtime.channels.get("my_channel")
        
        channel.presence.subscribe { message in
           print(message)
        }
        
    }
}

struct ChatView: View {
    
    private var ably = AblyHelper()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ChatView()
}

