From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7514] New: No centrino-speedstepping w/  HP nx7400 (rh402et)
Date: Mon, 13 Nov 2006 12:08:27 -0800
Message-ID: <200611132008.kADK8RHc021084@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7514

           Summary: No centrino-speedstepping w/  HP nx7400 (rh402et)
    Kernel Version: 2.6.27-10 up to 2.6.18.2
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: public.email@web.de


Distribution: Kubuntu 6.10
Hardware: HP NX7400 (rh402et), BIOS N07 (Downgrade borks up the whole thing)

Problem Description:

Can't load speedstep-centrino with the current kernels.

FATAL: Error inserting speedstep_centrino
(/lib/modules/2.6.17-10-generic/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko):
No such device

Collected the most important things (dmesg, acpidump, kernel config) at
http://www.wegotocanada.de/privat/nx7400

Steps to reproduce:

Just type 'modprobe speedstep-centrino'

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
