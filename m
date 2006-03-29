From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6303] New: Fujitsu-Siemens P4 Amilo D 7830 laptop has no
	govenors with 2.6.16
Date: Wed, 29 Mar 2006 13:59:14 -0800
Message-ID: <200603292159.k2TLxEZN028316@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6303

           Summary: Fujitsu-Siemens P4 Amilo D 7830 laptop has no govenors
                    with 2.6.16
    Kernel Version: 2.6.16.1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: cbradney@zip.com.au


Most recent kernel where this bug did not occur: Gentoo sources 2.6.15-r7
Distribution:Gentoo
Hardware Environment:Fujitsu Siemens Amilo D 7830, P4 2.66
Software Environment:Gentoo ~x86
Problem Description:With Gentoo sources (yes I know, not mainline) 2.6.15 and
all 2.6.* I can remember before, I had governors that worked. With 2.6.16 and
2.6.16.1 (vanilla-sources, ie mainline) the /sys/../cpu0 directory is completely
empty.

Steps to reproduce: Booting between the 2 kernels, with the same config in both
shows 2.6.15 works, 2.6.16 doesnt. All built in.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
