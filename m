From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7186] p4-clockmod reports wrong MHz in /proc/cpuinfo desktop P4
Date: Fri, 22 Sep 2006 13:34:43 -0700
Message-ID: <200609222034.k8MKYhPj030315@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7186

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |davej@codemonkey.org.uk
              Owner|cpufreq@www.linux.org.uk    |acpi_power-processor@kernel-
                   |                            |bugs.osdl.org
          Component|cpufreq                     |Power-Processor
           Category|Power Management            |ACPI



------- Additional Comments From davej@codemonkey.org.uk  2006-09-22 13:24 -------
We've changed so little in this driver that I'm almost convinced this has to be
an ACPI regression.  Either that, or we've started taking interest in some
different ACPI tables that we didn't used to, and your BIOS happens to contain
nonsense values.

Acpi folks, what say you?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
