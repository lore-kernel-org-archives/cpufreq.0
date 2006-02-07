From: Arthur Huillet <arthur.huillet@free.fr>
Subject: cpufreq-nforce2 to make dynamic overclocking
Date: Tue, 7 Feb 2006 22:19:51 +0100
Message-ID: <20060207221951.330d7407.arthur.huillet@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hello,

the cpufreq-nforce2 driver enables CPU frequency scaling by changing the FSB. Currently it is only
used to "downclock" the CPU in order to consume less power, but it could very well be modified to
allow overclocking. The point here would be to implement something like what MSI did some time
ago : dynamic (= on system load raising) overclocking. Nforce2/Athlon platforms have a very good
potential for overclocking and can easily handle the 10% overclocking we're speaking about.

I've begun modifying the nforce2 module, however, I'd need some
comments from you cpufreq guys before going on, in order not to go in the wrong direction. 

My views on this overclocking are the following :
- overclocking must not be done automatically by kernel
- overclocking must be directly controlled by the user, ie., work only with the "userspace governor"
- a userspace daemon would raise the frequency when needed and put it down again

However, the implementation is not that easy due to some things CPUFreq does. My first idea was to
use the userspace "scale_setspeed" interface to let the user overclock, while preventing the
"performance" governor to overclock automatically (which is in my opinion, dangerous), by setting
policy->max to the nominal frequency. 

But then, even the userspace governor is unable to overclock :
(output from dmesg : 
userspace: cpufreq_set for cpu 0, freq 2184000 kHz
cpufreq-core: target for CPU 0: 2004000 kHz, relation 0
)

because of cpufreq_userspace.c :
	if (freq > cpu_max_freq[cpu])
		freq = cpu_max_freq[cpu];

where cpu_max_freq is set to policy->max ... so what is the point of cpuinfo.max_freq ?
This approach would then require patching the userspace governor ...

So my other idea was to provide the user with a direct interface to cpufreq-nforce2, using a sysfs
file. This would remove the need of patching the cpufreq tree (apart from cpufreq-nf2 itself) to
implement my dynamic overclocking... 

What approach would be the best in your opinion ? 

Thanks in advance.
-- 
Greetings, 
A.H.
