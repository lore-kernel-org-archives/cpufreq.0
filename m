From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10653] p4-clockmod gets a wrong max clock (1.2GHz insted 1.6GHz)
Date: Sun, 11 May 2008 10:21:52 -0700 (PDT)
Message-ID: <20080511172152.969C710805E@picon.linux-foundation.org>
References: <bug-10653-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10653-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10653





------- Comment #3 from andrea.cimitan@gmail.com  2008-05-11 10:21 -------
I've reached to use p4-clockmod with 1.6GHz.

The issue is that p4-clockmod reads the cpu speed when it is loaded (modprobe),
sets it as the maximum frequency then generates the lower available ones.

In fact, if I load the module when my laptop is running at 1.2GHz (for example
when using built-in speedstep technology of my motherboard) p4-clockmod will
give me these results (with 1.2GHz as maximum available), though if I load
p4-clockmod when my frequency is 1.6GHz (when my laptop is in AC) then i get
the right ones: cat
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
200000 400000 600000 800000 1000000 1200000 1400000 1600000

To fix it I have disabled speedstep hardware management from the BIOS, so when
p4-clockmod is loaded in the bootup the frequency is 1.6GHz (no speedstep) and
it gets the right frequencies.

P4-clockmod is fine over acpi-cpufreq (in fact acpi-cpufreq gives me only 1.2
and 1.6 which is quite useless for power-management), but maybe it should be
fixed when getting the right CPU info after is first loading.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
