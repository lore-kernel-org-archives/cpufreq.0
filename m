From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Wed, 2 May 2007 14:55:10 -0700
Message-ID: <200705022155.l42LtA9W031192@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255





------- Additional Comments From dsd@gentoo.org  2007-05-02 14:55 -------
Here's how it works for you at the moment:

powernow-k7 can't find any of the powernow performances tables that match your
CPU. Instead, it falls back on the performance tables in the ACPI BIOS (DSDT) to
figure out the available frequencies.

It turns out that those tables aren't much good either. Taking the first entry:

                Package (0x06)
                {
                    0x03B6,
                    0x5DC0, 
                    0x7D, 
                    0x7D, 
                    0x009C418D, 
                    0x018D
                }, 

The first value (0x03B6) is 950 in decimal, and this represents the CPU
frequency for this performance state.

The FID and VID of the performance state are encoded in the 5th value
(0x009C418D). The FID can be looked up in a table in the powernow-k7 driver to
deduce a multiplier, 9.5 in this case. Multiply 9.5 by the FSB and you get the
frequency.

So, it looks like your ACPI tables were written for a system with a 100mhz FSB
(9.5 * 100 = 950, which is consistent with the first value). However, your FSB
is 133mhz.

We have been working on the earlier assumptions that the multiplier encoded by
the FID code is correct, whereas the frequency (in the first field) is
incorrect. e.g. we decided that "9.5 * 133 = 1266mhz" is the right calculation.
This isn't an unfair assumption to make, and this is how the powernow driver
works anyway (uses ACPI-supplied-multiplier * fsb, not ACPI-supplied-frequency)
but the reality is that it looks like both the FID(multiplier) *and* frequency
values in the ACPI performance state tables are wrong. To reach maximum
frequency there would have to be a performance state with a FID that encodes a
multiplier of 10.0 (10 * 133 = 1333mhz).

At this point we're beyond the level where this could be fixed in the kernel
(since all of the data sources are wrong!). If you know what the allowed
frequencies were *supposed* to be, I could help provide a new DSDT. Or, we could
even just add another performance state with a 10.0 multiplier. However I'm not
sure how safe it is to mess with stuff like this...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
