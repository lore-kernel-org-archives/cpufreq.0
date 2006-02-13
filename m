From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6063] /proc/cpufreq and /sys/devices/system/cpu/cpu0/cpufreq
	don't exist
Date: Sun, 12 Feb 2006 17:55:08 -0800
Message-ID: <200602130155.k1D1t8a1002016@fire-2.osdl.org>
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

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |acpi_power-processor@kernel-
                   |                            |bugs.osdl.org
          Component|cpufreq                     |Power-Processor
           Category|Power Management            |ACPI



------- Additional Comments From davej@codemonkey.org.uk  2006-02-12 17:55 -------
I think this is related to ACPI changes to how _PSS objects are handled.
Reassigning for now.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
