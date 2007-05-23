From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8523] New: Can't select 'ondemand' as default cpufreq governor
Date: Wed, 23 May 2007 03:48:22 -0700
Message-ID: <200705231048.l4NAmMqN007699@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8523

           Summary: Can't select 'ondemand' as default cpufreq governor
    Kernel Version: 2.6.21.1
            Status: NEW
          Severity: low
             Owner: cpufreq@www.linux.org.uk
         Submitter: paapaa125@hotmail.com


Distribution: Gentoo (64-bit)
Hardware Environment: Core 2 Duo

Problem Description: For some reason only 'performance' and 'userspace'
governors can be selected as default cpufreq governors. It would be great to let
the user select any governor (powersave, ondemand, conservative) as the default.
For my needs 'ondemand' is enough but I can't select it as default. This is the
actual setting:

Power management options -> CPU Frequency scaling -> CPU Frequency scaling ->
Default CPUFreq governor

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
