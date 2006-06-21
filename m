From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: ondemand vs suspend.
Date: Wed, 21 Jun 2006 14:01:05 -0700
Message-ID: <4499B391.5080708@goop.org>
References: <EB12A50964762B4D8111D55B764A8454110B16@scsmsx413.amr.corp.intel.com>
	<44972ACB.2040609@goop.org>
	<20060621115413.A16324@unix-os.sc.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020905040503050907020400"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060621115413.A16324@unix-os.sc.intel.com>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------020905040503050907020400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Venkatesh Pallipadi wrote:
> Does it only happen on CPU 1 or both the CPUs? What does /sys/.../cpufreq
> look like once you get to this stuck at lowest freq state? Does 
> scaling_available_frequencies still show all the freqs.
>   

Perhaps it isn't related to suspend.

My startup scripts set the governor for both CPUs to conservative.  Then 
later, not long after boot, with no suspend, I set them to 
"performance", but they don't switch speed.  If I switch to "userspace", 
writing to scaling_setspeed has no effect.

Confused.  Could this be related to the dual-coreness of the CPU?  Maybe 
things start misbehaving on policy switches?

This is 2.6.17-mm1 with the patch you just posted applied.

I've attached all the cpufreq sysfs files for each core.

    J


--------------020905040503050907020400
Content-Type: text/plain;
 name="cpu0.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cpu0.txt"

cpufreq/scaling_setspeed:
1000000
cpufreq/stats/trans_table:
   From  :    To
         :   1833000   1333000   1000000 
  1833000:         0         0         1 
  1333000:         0         0         0 
  1000000:         0         0         0 
cpufreq/stats/time_in_state:
1833000 0
1333000 0
1000000 188851
cpufreq/stats/total_trans:
1
cpufreq/scaling_cur_freq:
1000000
cpufreq/cpuinfo_cur_freq:
1000000
cpufreq/scaling_available_frequencies:
1833000 1333000 1000000 
cpufreq/scaling_available_governors:
conservative ondemand powersave userspace performance 
cpufreq/scaling_driver:
centrino
cpufreq/scaling_governor:
userspace
cpufreq/affected_cpus:
0
cpufreq/scaling_max_freq:
1000000
cpufreq/scaling_min_freq:
1000000
cpufreq/cpuinfo_max_freq:
1833000
cpufreq/cpuinfo_min_freq:
1000000

--------------020905040503050907020400
Content-Type: text/plain;
 name="cpu1.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cpu1.txt"

cpufreq/scaling_setspeed:
1000000
cpufreq/stats/trans_table:
   From  :    To
         :   1833000   1333000   1000000 
  1833000:         0         0         0 
  1333000:         0         0         0 
  1000000:         0         0         0 
cpufreq/stats/time_in_state:
1833000 0
1333000 0
1000000 187899
cpufreq/stats/total_trans:
0
cpufreq/scaling_cur_freq:
1000000
cpufreq/cpuinfo_cur_freq:
1000000
cpufreq/scaling_available_frequencies:
1833000 1333000 1000000 
cpufreq/scaling_available_governors:
conservative ondemand powersave userspace performance 
cpufreq/scaling_driver:
centrino
cpufreq/scaling_governor:
userspace
cpufreq/affected_cpus:
1
cpufreq/scaling_max_freq:
1000000
cpufreq/scaling_min_freq:
1000000
cpufreq/cpuinfo_max_freq:
1833000
cpufreq/cpuinfo_min_freq:
1000000

--------------020905040503050907020400
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------020905040503050907020400--

