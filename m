From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6063] New: /proc/cpufreq and
	/sys/devices/system/cpu/cpu0/cpufreq don't exist
Date: Sun, 12 Feb 2006 16:26:21 -0800
Message-ID: <200602130026.k1D0QL7B030951@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6063

           Summary: /proc/cpufreq and /sys/devices/system/cpu/cpu0/cpufreq
                    don't exist
    Kernel Version: vanilla-2.6.15.1
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: jieryn@gmail.com


Most recent kernel where this bug did not occur: unknown
Distribution:         gentoo
Hardware Environment: amd64
Software Environment: vanilla-sources-2.6.15.1
Problem Description:  none of the following exist:

/sys/devices/system/cpu/cpu0/cpufreq
/proc/cpufreq
/proc/sys/cpu/*/speed
/proc/sys/cpu/*/speed-min
/proc/sys/cpu/*/speed-max


Steps to reproduce:   compile 2.6.15.1 kernel and enable CONFIG_CPUFREQD

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
