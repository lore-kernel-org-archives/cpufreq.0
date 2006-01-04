From: Nebojsa Trpkovic <trxman@gmail.com>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Wed, 04 Jan 2006 14:04:31 +0100
Message-ID: <43BBC7DF.7040900@gmail.com>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
	<20060103162946.GF13887@poupinou.org>
	<dpf5ue$4a0$1@sea.gmane.org> <43BB29FF.2000401@gmail.com>
	<20060104104540.GI13887@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20060104104540.GI13887@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

Bruno Ducrot wrote:

>My though was more towards what Gunter Ohrner stated, that is if it's
>interresting to add some intermediate low p-state between the already
>given one and the first high p-state given the actual status of
>the algorithms used (as the on-demand and maybe other I'm working ATM).
>
I just wanted to tell Gunter Ohrner that there are some more usefull 
methods then lowering CPU frequency to 800MHz.

As for low-low p-state transition, my experiments show that it's quite 
possible, but I don't know exact details such as transition latency and 
so on. Namely, when I've got Newcastle and Winchster, I've wanted to 
test them on various frequencies and voltages to make some kind of 
undetailed "preview" of graphs I made latter. It was a little bit boring 
to restart computer every time I wanted to change frequency and/or 
voltage, so I've installed Windows XP and software called "CPU MSR" wich 
allowed me to manually set FID and VID of the CPU in the real-time 
operation. (I think that FID transition latency was about 1000 "bus 
cycles" and VID transition latency about 1ms, but I'm not sure). So, on 
the Newcastle I've menaged to change multiplier down to 4 (800MHz), 
because my Newcastle was Socket 754 CPU and had 800MHz HTT. All other 
transitions between low p-states went without problem (multiplier 4 to 
5, 5 to 6, 4 to 6, 6 to 4 and so on).

>>I've found that almost all Athlon64 CPUs can work at a lot lower 
>>voltage then in AMD specs.
>>    
>>
>
>You are right.  But I am not sure however if running out-of-spec a
>processor will have a consequence for it's whole life time though.
>  
>
I can understand that running processor out-of-spec in terms of higher 
voltage than default one in long time periods could be dangerous because 
of heat disipation, changing of internal structure due to "runaway" 
atoms pulled away by electromagnetic forces stronger then at default 
voltage and so on,
but I realy can't see and negative aspect nor physical threat for 
processor when it's undervolted, except (ofcorse) stabilty issues if one 
goes too far with voltage lowering (where prime95 comes very handy :) ).

Greetings,
Nebojsa Trpkovic
