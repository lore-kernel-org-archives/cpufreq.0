From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue, 24 Jun 2008 04:50:17 -0700 (PDT)
Message-ID: <20080624115017.765CC11D10B@picon.linux-foundation.org>
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





------- Comment #58 from trenn@suse.de  2008-06-24 04:50 -------
Comment #57 is the prove that Windows is:
  a) Polling the temperature even the BIOS does not tell the OS to dos so
     (at least not in ACPI specified way)
  b) Windows providing a kind of virtual passive trip point

The sad story is that this has been brought up already (set polling by default,
provide a possibility to lower or create passive trip points).

It took 3 years to prove that Windows is doing it. Nobody will prove whether
only XP is polling or also Vista or other flavors. Nobody will ever prove
whether (quite likely) this is a machine/model specific Windows workaround.

So while "Windows is doing it" is the keyword for Len to add something, this is
a nice example that the "Windows compatibility" argument is not worth much (for
most/all things not related to general ASL syntax).
IMO this should still go into a DMI blacklist (as the machine violates the
specs). General rule should be blacklisting spec violating machines, not adding
"Windows compatibility" bug workarounds in general. Windows behavior might
change again in two years, staying close to the specs is always the best.

But please add something... (I even don't mind adding this workaround in
general, punishing systems who take care about the Spec and Linux), there has
been enough bad publicity like "Linux may overheat your system, you don't get a
Cent if this happens and your vendor does not support Linux". I mean of course
you are better off buying a SUSE pre-loaded Linux supported Lenovo T61 if you
are working on Linux...

Thermal management affected -> increasing serverity of the bug. Pfff, I cannot
even change the severity.
Why is the bug still set to needinfo? Can someone remove it and assign it to
Len again.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
