From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9636] cpufreq reports too low max freq on Intel P4
Date: Wed, 26 Dec 2007 04:39:09 -0800 (PST)
Message-ID: <20071226123909.F2C38108010@picon.linux-foundation.org>
References: <bug-9636-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9636-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9636





------- Comment #2 from peter.ganzhorn@googlemail.com  2007-12-26 04:39 -------
BTW: I'm using the ondemand-governor and acpi-cpufreq as driver:

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver 
acpi-cpufreq
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
ondemand


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
