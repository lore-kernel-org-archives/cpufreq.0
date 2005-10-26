From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5495] changing cpu frequency causes fatal USB errors
Date: Tue, 25 Oct 2005 20:07:20 -0700
Message-ID: <200510260307.j9Q37KDt002360@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5495





------- Additional Comments From dbrownell@users.sourceforge.net  2005-10-25 20:03 -------
That's not something I'd expect to see.  You're sure that BIOS
is ignoring this?  (Enable the "usb-handoff" kernel parameter.
at least for kernels with the latest USB patches.)

For OHCI, the "Unrecoverable Error" usually mean some sort of
DMA pointer was smashed (or acts smashed).  Were there any USB
devices connected at the time?  If not, that narrows down the
potential options enormously.  ... Likewise with EHCI, also
normally a DMA access problem.  Very odd that _both_ get such
issues at the same time.  (Another possible error causing
this:  something smashed the pages those drivers use for
their DMA descriptor chains.)

Were you maybe re-clocking the memory while one of the USB
controllers was performing DMA?  Or goofed on the cache
coherency guarantees that you must follow to re-clock all
four processors at the same time ..

The "leak ed" shows up sometime, it's a "should not happen"
but maybe there's an SMP issue.  The leak is minor and AFAIK
harmless, though I'd be glad to see a patch.

Is it possible that this is one of the kinds of system that needs
its I/O peripherals to be idled before changing clocks?  Or which
needs to adjust some of the I/O clocks (e.g. 48 MHz USB PLL) after
adjusting the clock from which the CPU clock is derived?  I hadn't
though PC chipsets needed such things.

"lspci -vv" output should be included in the bug report, as
well as records of the OHCI and EHCI controllers initializing.
And "lsusb -v" output too (for lsusb v0.71 or newer).

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
