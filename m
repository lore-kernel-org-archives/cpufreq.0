From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6851] Suspend to RAM and Ondemand Lockup/Stack trace
Date: Wed, 9 Aug 2006 21:23:29 -0700
Message-ID: <200608100423.k7A4NTV7017133@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6851

len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Power-Sleep-Wake            |cpufreq
           Category|ACPI                        |Power Management



------- Additional Comments From len.brown@intel.com  2006-08-09 21:17 -------
Please verify that this issue is gone using 2.6.18-rc4 or later.
(moving to PM/cpufreq, since this is not an ACPI issue)

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
