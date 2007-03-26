From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load
Date: Sun, 25 Mar 2007 20:12:09 -0700
Message-ID: <200703260312.l2Q3C9rU002885@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8228

len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi-
                   |                            |bugzilla@lists.sourceforge.n
                   |                            |et
            Summary|CPU Scaling doesn't work.   |acpi-cpufreq does not load



------- Additional Comments From len.brown@intel.com  2007-03-25 20:12 -------
rather than just the DSDT, please attach the complete output from acpidump.
If the distro doesn't have it, you can get a copy of the acpidump
utility in the latest pmtools there:
http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
