From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9181] cpu frequency governer does not change cpu frequency after
	hibernation and comeback
Date: Sat, 20 Oct 2007 11:47:00 -0700 (PDT)
Message-ID: <20071020184700.D42A5108010@picon.linux-foundation.org>
References: <bug-9181-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9181-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9181


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de




------- Comment #1 from trenn@suse.de  2007-10-20 11:47 -------
Can you try a bit more.., e.g.:
does it work with ondemand governor
after conservative governor broke, does switching to other governors, e.g.
powersave, performance still work?
These are the easy to test..., if you know how to compile and a kernel it would
be great if you could test the latest 2.6.23.1 or -git kernel. Then also enable
CONFIG_CPU_FREQ_DEBUG=y (or similar), boot with cpufreq.debug=7 (or enable it
at runtime: "echo 7 >/sys/module/cpufreq/parameters/debug") and attach
syslog/klog output.
Not sure, but I think I saw a report with ondemand governor breaking away after
suspend..., I try to find it.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
