From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6367] acpi-cpufreq: fancy CPUfreq values - can't load
	p4-clockmod anymore
Date: Fri, 22 Jun 2007 00:14:59 -0700 (PDT)
Message-ID: <20070622071459.99A8211C001@picon.linux-foundation.org>
References: <bug-6367-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-6367-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6367


oopla@users.sf.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REJECTED                    |REOPENED
         Resolution|UNREPRODUCIBLE              |




------- Comment #9 from oopla@users.sf.net  2007-06-22 00:18 -------
this happens again also in 2.6.19.7

acpi_cpufreq sets these scaling freqs, as in original report:
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
2700000 65535000 65535000 65535000 65535000 65535000 65535000 65535000 65535000
65535000 65535000 65535000 65535000 65535000 65535000

once loaded, acpi_cpufreq can't be removed and p4-clockmod can't be loaded.

same for p4_clockmod as in original report, scaling freqs are bound > 2GHz,
which turns out to be wrong on this CPU. 
Seems that p4-clockmod can be unloaded.

Seems that loading/unloading cpufreq-stats doesn't oopses anymore, though, so
there seems to be an improvement.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
