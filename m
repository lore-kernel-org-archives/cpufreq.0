From: bugme-daemon@osdl.org
Subject: [Bug 3144] New: modprobe speedstep-smi fails
Date: Sun, 1 Aug 2004 13:34:38 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408012034.i71KYc5b010140@fire-1.osdl.org>
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

http://bugme.osdl.org/show_bug.cgi?id=3144

           Summary: modprobe speedstep-smi fails
    Kernel Version: 2.6.7
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: schwientek@web.de


Distribution:gentoo 
Hardware Environment: 
IBM Thinkpad T22, Intel Pentium3 Coppermine Processor 
 
 
bash-2.05b# modprobe speedstep-smi 
FATAL: Error inserting speedstep_smi 
(/lib/modules/2.6.7/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): No 
such device 
 
No /proc/cpufreq is created. 
 
I  use addional acpi for this laptop.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
