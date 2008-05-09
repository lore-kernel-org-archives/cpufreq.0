From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10654] cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	gets BUG on Transmeta Crusoe CPU
Date: Fri,  9 May 2008 05:13:43 -0700 (PDT)
Message-ID: <20080509121343.9CBAF10805F@picon.linux-foundation.org>
References: <bug-10654-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10654-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10654





------- Comment #3 from trenn@suse.de  2008-05-09 05:13 -------
The p4-clockmod must not be used, take the throttling interface exposed through
drivers/acpi/processor_throttling.c
instead.

I hope it finally gets removed from the kernel, here a quote from the cpufreq
list a while ago (Subject: Celeron 220):
-----------
DaveJ shut it off in the Fedora kernels a while ago now, and only a few people 
have even noticed, and most understood that it was for the best...
-----------


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
