From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5516] New: CPUFrequency driver doesn't have stats for CPU
	voltage
Date: Fri, 28 Oct 2005 11:00:51 -0700
Message-ID: <200510281800.j9SI0p8c023028@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5516

           Summary: CPUFrequency driver doesn't have stats for CPU voltage
    Kernel Version: 2.6.14
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: t.artem@mailcity.com


Problem Description: under /sys/devices/system/cpu/cpu0/cpufreq/ there are no
files related to CPU voltage. That would be nice to have files like:

cpuinfo_cur_volt
cpuinfo_max_volt
cpuinfo_min_volt

I suppose their names are self explanatory.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
