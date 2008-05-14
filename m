From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq question
Date: Wed, 14 May 2008 13:47:40 -0700
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEE010D4495@orsmsx423.amr.corp.intel.com>
References: <B6790881E7413D4092359CC9B3D8EEFD04EADAAE@dlee12.ent.ti.com><200805141444.05019.jwilson@redhat.com><6453C3CB8E2B3646B0D020C112613273093959@sausexmb4.amd.com><B6790881E7413D4092359CC9B3D8EEFD04EADB27@dlee12.ent.ti.com><6453C3CB8E2B3646B0D020C11261327309395A@sausexmb4.amd.com>
	<B6790881E7413D4092359CC9B3D8EEFD04EADB5F@dlee12.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-reply-to: <B6790881E7413D4092359CC9B3D8EEFD04EADB5F@dlee12.ent.ti.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Frazier, John" <j-frazier2@ti.com>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, Jarod Wilson <jwilson@redhat.com>, cpufreq@lists.linux.org.uk


Cpuspeed does not try to change freq more than once in few seconds. So,
I don't understand 'threads competing with each other to push CPU up and
down' part. The way things will work is cpuspeed looks at utilization of
each CPU and picks a freq target for the CPU. Hardware picks the highest
freq req among all CPUs in a socket and uses that for the whole socket.

If cpuspeed is not changing freq even when the CPU is 100% utilized over
few seconds, then it should be some bug in cpuspeed (IIRC, there is a
verbose mode in cpuspeed that should tell why it is not increasing the
freq on that core).

On a side note, you should also be able to use ondemand which does more
fine grained freq management.
#modprobe cpufreq_ondemand
#echo ondemand > /sys/devices/system/cpu/cpuX/cpufreq/scaling_governor
// for all CPUs X=0,1,2,3

Thanks,
Venki

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Frazier, John
>Sent: Wednesday, May 14, 2008 12:32 PM
>To: Langsdorf, Mark; Jarod Wilson; cpufreq@lists.linux.org.uk
>Subject: RE: cpufreq question
>
>Mark,
>
>Thanks for your answer. 
>
>I am using  Intel(R) Xeon(R) CPU           X5260  @ 3.33GHz X 2 cpus
>
>1. When cpuspeed starts there are 4 daemons.
>2. In many situations I see the cpuspeed bouncing radically back and
>forth between min to max.
>3. Eventually I will see that the cpu core 0 will be pegged at 100% but
>the speed will be 2K.
>
>I think that I am dealing with a 2 fold problem. One being 
>that cpuspeed
>counts nice time as idle. The other one is that I think that 
>the threads
>are competing to push the cpu up and down.
>
>Regards,
> 
>John Frazier
>
>-----Original Message-----
>From: Langsdorf, Mark [mailto:mark.langsdorf@amd.com] 
>Sent: Wednesday, May 14, 2008 2:20 PM
>To: Frazier, John; Jarod Wilson; cpufreq@lists.linux.org.uk
>Subject: RE: cpufreq question
>
> 
>> The version I am running is 1.2.1 and it works somewhat however I am
>> having some issues with the dual core cpus not scaling 
>correctly. That
>> is what led me down this path. I got a new version of 
>> cpuspeed from Carl
>> Thomas and it does need the affected_cpus file which of course is not
>> there. Is there a way to just add the file? 
>
>There are two ways to add the file:
>	edit your kernel to change drivers/cpufreq/cpufreq.c to 
>create the additional sysfs file.  You'll also need to correctly
>fill it with data, which you could either get from the device
>driver or just hardcode for your particular machine.
>
>or
>	update to any kernel past about 2.6.16 that will have
>the affected_cpus file.
>
>Either of these will make it difficult to get service from Red
>Hat, as you've altered the kernel and they only support the 
>kernel they provided.
>
>If you don't want to change your kernel, you need to revert 
>to the cpuspeed version that came with your product and 
>complain to your vendor about how it isn't handling dual CPUs
>correctly.
>
>Speaking of which: how is it not handling dual CPUs correctly?
>It might be doing the right thing.  Dual-core AMD Opterons, when 
>running on RHEL4, are supposed to run at the frequency of the
>busier core, for example.
>
>-Mark Langsdorf
>Operating System Research Center
>AMD
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
