From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: [PATCH] 2.6.5 speedstep on P4Ms
Date: Fri, 11 Jun 2004 00:30:03 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C8FD0B.4050108@cern.ch>
Reply-To: holbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

>
>
>>/ i also wonder about one thing, maybe you can help me on that. with the 
>/>/ old speedstep driver, i would have occational hard freezups of my 
>/>/ machine. this seems to be gone (just experimental evidence, since i 
>/>/ didn't have one in a few days now where before they occured about 
>/>/ hourly). so my guess is that something in this patch must have corrected 
>/>/ it. since my machine just has one physical cpu, i really don't 
>/>/ understand what went wrong before.  do you have any idea on that?
>/>/ 
>/
>IMHO the lockup is due to the fact we use local_irq_disable() but it
>should be done more globally.  I believe you may still have some lockup
>still.
>  
>
 i didn't, but that might be pure chance. :-)  so does one have to 
disable the interrupts on both siblings of a HT CPU seperately? i just 
don't know how this works.

thanks,

chris
