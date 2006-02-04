From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6005] can't change cpu frequency on pentium M
Date: Fri, 3 Feb 2006 16:57:48 -0800
Message-ID: <200602040057.k140vmVp021910@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6005

venkatesh.pallipadi@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEW                         |ASSIGNED



------- Additional Comments From venkatesh.pallipadi@intel.com  2006-02-03 16:57 -------
Make sure you have the following things selected in your config.

Power Management
    ACPI->Processor 

    cpufreq->Enhanced speedstep
       cpufreq->Enhanced speedstep->ACPI

    cpufreq->acpi cpufreq

If you have all these and still you don't see /sys/..../cpu0/cpufreq
then
- Add you .config file as attachment (don't inline, add it as attachement please)
- Add output of acpidump as an attachement. Use the latest pmtools here
http://www.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/ for acpidump.

Thanks,
Venki

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
