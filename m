From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7880] cpufreq detects wrong frequency on VIA Esther CPU
	(C7-1500)
Date: Sun, 28 Jan 2007 18:33:58 -0800
Message-ID: <200701290233.l0T2Xwlg011406@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7880

len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi-
                   |                            |bugzilla@lists.sourceforge.n
                   |                            |et



------- Additional Comments From len.brown@intel.com  2007-01-28 18:25 -------
65535000 isn't a random number, it is 0xFFFF * 1000

This is curious because...

The DSDT has two possible _PSS structures, each with 8 packages,
but only the 1st two packages used -- the following 6 are all F's:

        Name (PPS1, Package (0x02)
        {
            Package (0x06)
            {
                0x05DC,
                0x3A98,
                0x0A,
                0x0A,
                0x0F13,
                0x0F13
            },

            Package (0x06)
            {
                0x0320,
                0x1F40,
                0x0A,
                0x0A,
                0x0810,
                0x0810
            },

            Package (0x06)
            {
                0xFFFF,
                0xFFFF,
                0xFF,
                0xFF,
                0xFFFF,
                0xFFFF
            },

and 
       Name (PPS2, Package (0x02)
        {
            Package (0x06)
            {
                0x05DC,
                0x3A98,
                0x0A,
                0x0A,
                0x00B0,
                0x00B0
            },

            Package (0x06)
            {
                0x0320,
                0x1F40,
                0x0A,
                0x0A,
                0x00B1,
                0x00B1
            },

            Package (0x06)
            {
                0xFFFF,
                0xFFFF,
                0xFF,
                0xFF,
                0xFFFF,
                0xFFFF
            },
        Method (_PSS, 0, NotSerialized)
        {
            If (LEqual (PDCT, 0x00))
            {
                Return (PPS2)
            }
            Else
            {
                Return (PPS1)
            }
        }

This system has a hard-coded _PPC of 0, which means that PPC
will always allow all states that PSS has to be exported.
        Method (_PPC, 0, NotSerialized)
        {
            Return (0x00)
        }

So if there were some bug where the number of packages (2) above
did not limit what the kernel saw, then it would pick up an entry
for 65535000 KHz.



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
