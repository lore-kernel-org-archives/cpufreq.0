From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7851] New: cpufreq shows bad/incomplete infos
Date: Fri, 19 Jan 2007 07:06:06 -0800
Message-ID: <200701191506.l0JF66Z6007401@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7851

           Summary: cpufreq shows bad/incomplete infos
    Kernel Version: 2.6.19.1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: hetfield666@gmail.com


Most recent kernel where this bug did *NOT* occur:
Distribution: Gentoo
Hardware Environment: Asus P5B Deluxe (P965 chipset), Core 2 Duo E6300
Software Environment: Gentoo 64bit
Problem Description:
cpufreq-info shows

limiti hardware: 1.60 GHz - 1.86 GHz
frequenze disponibili: 1.86 GHz, 1.86 GHz, 1.86 GHz, 1.86 GHz, 1.86 GHz, 1.86
GHz, 1.86 GHz, 1.86 GHz, 1.86 GHz, 1.60 GHz

while it should go down until 1 ghz. 

/sys/devices/system/cpu/cpu{0,1}/cpufreq/scaling_available_frequencies
says the same.

i'm using the centrino /speedstep module.
i tried acpi-speedstep but it does't detect anything and i have no freq scaling.

according to http://forums.gentoo.org/viewtopic-p-3837305.html#3837305
an mm patch should be in place. if so, just tell me i'll be happy to test next week

Steps to reproduce:
run
cpufreq-info

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
