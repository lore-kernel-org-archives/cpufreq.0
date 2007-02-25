From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8081] New: Conservative governor sets wrong and too high
	sampling rates
Date: Sun, 25 Feb 2007 08:28:03 -0800
Message-ID: <200702251628.l1PGS3YC021654@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8081

           Summary: Conservative governor sets wrong and too high sampling
                    rates
    Kernel Version: 2.6.18
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: ferriste@libero.it


Most recent kernel where this bug did *NOT* occur: none, all kernels >=2.6.13 
are affected (this governor was added in 2.6.13 if I well remember...)

Distribution: Slackware 11.0

Hardware Environment: Asus laptop with amd athlon xp-m 2800+
Software Environment:

Problem Description: When conservative governor is selected, the minimun and 
maximum sampling rate are set to a value 10 times higher than normal, and the 
governor looks at system load only 1 times per second approximately. On my 
laptop, the ondemand governor has a minimum sampling rate of 99500 (0.0995 
seconds) while with conservative this value is 995000 (0.995 seconds). If one 
considers that the default sampling rate is set to 2*minimum, most of users 
will find the conservative governor useless if they don't know how to modify 
it, because the system will not respond to a rapid increasing load.

The reason of this bug is a wrong defined value in the source file of 
conservative. If you look at conservative.c at line 497, you will find this:

def_sampling_rate = 10 * latency * 					
DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;

this should be changed to:

def_sampling_rate = latency * 					
DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;

as is in the ondemand governor. I've recompiled the module with this change 
and now conservative works fine.

My values
Conservative governor (2.6.18 kernel from kernel.org): a cat in the 
conservative folder shows:

bash-3.1# cat sampling_rate_min sampling_rate_max
995000
995000000

Patched conservative (with the correction indicated above):

bash-3.1# cat sampling_rate_min sampling_rate_max
99500
99500000

Ondemand governor (2.6.18 kernel from kernel.org):
bash-3.1# cat sampling_rate_min sampling_rate_max
99500
99500000


Steps to reproduce: cd /sys/devices/system/cpu/cpu0/cpufreq/
echo ondemand > scaling_governor
than take a look in the ondemand folder at files sampling_rate_min, 
sampling_rate_max, sampling rate.
Than do the same thing with conservative:
echo conservative > scaling_governor
and compare the values. You will see that these values are from 10 times (most 
recents kernels) to 100 times (kernels 2.6.13 from 2.6.15) higher than 
ondemand sets.

You can also load the cpufreq_stats module and look in the stats folder 
(/sys/.../cpufreq/stats). You will see that ondemand causes a lot of 
transitions, while conservative does not.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
