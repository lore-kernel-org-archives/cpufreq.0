From: bugme-daemon@osdl.org
Subject: [Bug 3180] New: powernowk8 compiles into kernel only if
	CONFIG_ACPI_PROCESSOR=y
Date: Tue, 10 Aug 2004 01:39:07 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408100839.i7A8d7Ux025451@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3180

           Summary: powernowk8 compiles into kernel only if
                    CONFIG_ACPI_PROCESSOR=y
    Kernel Version: 2.6.7 and 2.6.8-rc4
            Status: NEW
          Severity: high
             Owner: cpufreq@www.linux.org.uk
         Submitter: taeuber@informatik.hu-berlin.de


Distribution: SuSE Linux 9.1 (x86-64)
Hardware Environment: Tyan single Opteron 140
Software Environment:
Problem Description:

powernowk8 doesn't compile into kernel when CONFIG_ACPI_PROCESSOR=m or is not set

it should depend on that in the menuconfig

Steps to reproduce:

mark powernowk8 as compiled into kernel and not acpi_processor or only as module


Thanks for your great job any way

Lars

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
