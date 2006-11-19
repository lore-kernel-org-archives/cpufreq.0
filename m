From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7514] No centrino-speedstepping w/  HP nx7400 (rh402et)
Date: Sat, 18 Nov 2006 19:46:22 -0800
Message-ID: <200611190346.kAJ3kM9k004203@fire-2.osdl.org>
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

venkatesh.pallipadi@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEW                         |ASSIGNED



------- Additional Comments From venkatesh.pallipadi@intel.com  2006-11-18 19:44 -------
Model numbers in speedstep-centrino are for legacy reasons. Models numbers are 
not required for all CPUs that the driver supports. Kernel ideally gets all 
the required information from BIOS using ACPI and enable speedstep. That is 
how speedstep is designed to work. Just that BIOS folks messes up things from 
time to time. I haven't yet actually looked at acpidump in this case to figure 
out whether the BIOS is the problem here. Will do it soon.

I the mean time can you make sure that you are running with latest BIOS and 
also check whether there are any speedstep related option in BIOS and if it is 
there make sure they are enabled. They are typically called as Enhanced 
Speedstep, EIST, Intel Speedstep or similar names.

Also, does any of the driver (acpi_cpufreq or speedstep_centrino) used to work 
on this system with any of the earlier kernels?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
