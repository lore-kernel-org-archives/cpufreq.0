From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6382] Random lockups, no kernel panic just a compleate hang
Date: Thu, 13 Apr 2006 06:14:29 -0700
Message-ID: <200604131314.k3DDETQM009562@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6382





------- Additional Comments From seife@kernelbug.slipkontur.de  2006-04-13 06:14 -------
what cpufreq governor are you using? Depending on the powersave configuration 
it might be userspace or ondemand.
See /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor.
also, a "grep -r . /sys/devices/system/cpu/" will give a quick overview of the 
used configuration.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
