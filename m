From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue, 13 May 2008 17:39:57 -0700 (PDT)
Message-ID: <20080514003957.8501E108061@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10658


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi-
                   |                            |bugzilla@lists.sourceforge.n
                   |                            |et
             Status|NEW                         |REJECTED
          Component|Power-Processor             |Power-Thermal
         Resolution|                            |DOCUMENTED
            Summary|CPU overheats at high       |thermal shutdown - Dell
                   |frequencies, ACPI fails to  |Precision M20, Latitude D610
                   |throttle sufficiently.      |




------- Comment #23 from len.brown@intel.com  2008-05-13 17:39 -------
I agree that it is a Linux problem that the D610 overheats
when running, when it doesn't overheat running Windows.

However, that doesn't mean that it is either a
Linux/cpufreq bug or a Linux/ACPI bug.

cpufreq has zero responsibility for cooling the system.
Even though you've been successful at using it for that
purpose, that is not what it is designed to do.
(nor do I think should it be -- particularly for a system
like this one that doesn't provide any OS thermal control)

Further, the D610 is not providing Linux the ACPI hooks needed
to either control the fan or passively cool the CPU.

The fact that the system overheats when the fans are running
full blast means that either the cooling hardware is failing
or the system was designed outside thermal guidelines.
Don't assume that the later is impossible...

I had a D600 a while back that would invoke throttling
via SMM -- confused the heck out of my benchmark results...
I could sometimes observe this by tracking
the contents of /proc/acpi/processor/*/throttling

My assumption is that Windows has some "special sauce" from
Dell in the form of a platform specific driver to help
the D610 run Windows properly.  The fix for Linux is for
Dell to provide the same assistance to Linux.
The i8k is the only weapon we have, as far as i know.

Dell never shipped Linux on this box, so I have zero expectation
that they'd go provide something at this point.  Indeed, for a box
this old, I wouldn't even expect a BIOS update from Dell.
However, as the BIOS is the code controlling your thermals
when Linux is running, you should certainly verify that you're
running the latest BIOS that is available...

I'm closing this as "Documented".

After you verify that you're running the latest BIOS
and that it provides no BIOS SETUP knobs related to cooling, and
after you re-assemble your thermal solution using arctic-silver
or whatever and find that it doesn't help...
I recommend that you work around this by using ondemand,
but limit the maximum frequency via
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
