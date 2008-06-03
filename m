From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue,  3 Jun 2008 10:29:37 -0700 (PDT)
Message-ID: <20080603172937.E6A8211D107@picon.linux-foundation.org>
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
             Status|NEW                         |NEEDINFO




------- Comment #46 from len.brown@intel.com  2008-06-03 10:29 -------
Consider the cause of bug 8842.
The BIOS exported a bogus _PSV of 50C.
Linux polled the thermal zone and dutifully throttled the
processor when it hit 50C, severely impacting
performance under normal use.

Why did windows not run into this problem?
Because Windows doesn't poll, and thus never
exposed a very obvious BIOS bug.

If Linux polls, it exposes itself to an area
of BIOS and EC which was NOT VALIDATED ON WINDOWS.

Whelp, the reality today is that in the horizontal PC
computer industry, if it isn't validated on Windows,
it isn't validated at all.

So the stated goal of the Linux/ACPI sub-system is to
take the pragmatic course of making systems work
by attempting to exercise the validated paths through
their BIOS/EC/firmware rather than the non-validated paths.
However, any other strategy would be wildly impractical.

That is why Linux must NOT enable
polling by default on any system which hasn't
been validated to handle it properly.

So I'll be delighted to accept a patch that recognizes
a broken machine via DMI and invokes a workaround --
-- as long as it doesn't hurt other instances of
the same machine that do not have the problem.
The workaround must not be deployed for all machines --
even if the profile where it is applied seems narrow,
it would apply to thousands of models.

Re: making Linux smarter about thermals.
I agree with this desire, and we implemented the generic thermal I/F
was  explicitly to help out with this.
It applies to both ACPI and non-ACPI systems.
However, you must realize that on the population of
ACPI systems in the marketplace, there are some
significant practical constraints on the ability of the OS
to do something other than what ACPI intends.

In particular, the ACPI BIOS owns the trip points --
Linux does not.  The ACPI EC decides if and when
to send an event to the OS.  If we change what
Linux thinks is a trip point, that doesn't mean
that the EC will send us an event when the temperature
crosses it.  Further, the ACPI BIOS has the right to re-define
trip points at run time, and to implement hysteresis it often does this.
On some machines the EC will send us interesting
temperature change events, and on some machines it will not.
ie. the phantom _PSV scheme may work on some systems
and not on others -- it would require polling to make sure
we notice the temperature change;
but polling is itself problematic per above.

Martin,

> The system works okay in Windows.

Can you figure out what it is doing?
Are there any Dell or platforms specific drivers present?
Is it throttling the processor when it gets hot?

Please attach the output from this command when the machine is warm:
grep . /sys/firmware/acpi/interrupts/*
It will show us which GPEs are firing and perhaps give some insight
into a DSDT which is apparently full of SMI abuse.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
