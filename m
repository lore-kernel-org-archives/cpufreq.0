From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5353] cpufreq_conservative: cpu always in slowest mode even
	under high load
Date: Thu, 26 Jan 2006 13:16:55 -0800
Message-ID: <200601262116.k0QLGtD9013637@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5353





------- Additional Comments From michal@physics.ubc.ca  2006-01-26 13:16 -------
I've seen something that may be related on a Dell Inspiron 630m.

When the plug gets pulled to switch to batteries, scaling_max_frequency drops to
the lowest speed (and usually the cpu speed drops as well, but not always - so
sometimes the cpu speed is actually faster than the policy limits).  Then about
15 seconds later a CPU acpi event occurs and the scaling_max_frequency pops back
to where it was.  I don't think this is due to any user space tools.  It happens
exactly the same way if laptop_mode is running or not and if acpid is running or
not.

If I try to set scaling_max_frequency to some other frequency value with 
echo -n (or with cpufreq-set) the new value is ignored.  After the acpi CPU
event, exactly the same command does its job.

This happens with any of the governors running (tried userspace, conservative,
performance). 

Sometimes conservative seems to get confused - the only consistent way I've seen
to make it confused is to start to hibernate, and then pull the plug.  After
starting up on ac (using swsusp2) the governor won't make any changes to the
speed.  Pulling the plug actually does seem to get it unconfused.

I've tried speedstep_centrino with freq_table as well as acpi_cpufreq and see
the same behaviour either way.

I have 2.6.15 with swsusp2

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
