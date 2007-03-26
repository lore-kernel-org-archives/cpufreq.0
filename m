From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Mon, 26 Mar 2007 09:46:37 -0700
Message-ID: <200703261646.l2QGkbXU025765@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8228

len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cpufreq@www.linux.org.uk
              Owner|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
          Component|cpufreq                     |Config-Processors
           Category|Power Management            |ACPI
            Summary|acpi-cpufreq does not load  |acpi-cpufreq does not load -
                   |                            |Fujitsu Siemens Amilo M1425,
                   |                            |M1437G - Intel(R) Pentium(R)
                   |                            |M



------- Additional Comments From len.brown@intel.com  2007-03-26 09:46 -------
DSDT shows no _PCT, _PSS, _PPC for P-state control,
but does show that an SSDT is supposed to be loaded
based on results of _PDC -- but dynamic SSDT is not
mentioned in the dmesg.

     Processor (CPU1, 0x01, 0x00000810, 0x06)
        {
            OperationRegion (SSDT, SystemMemory, 0xFFFF0000, 0xFFFF)
            Name (NCPU, 0x00)
            Name (TYPE, 0x80000000)
            Name (HNDL, 0x80000000)
            Method (_PDC, 1, NotSerialized)
            {
                CreateDWordField (Arg0, 0x08, DAT0)
                Store (DAT0, TYPE)
                OperationRegion (PMRG, SystemIO, \PMBS, 0x50)
                Field (PMRG, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x41),
                    DEV4,   1,
                    DEV5,   1,
                    DEV6,   1,
                    DEV7,   1,
                    STS4,   1,
                    STS5,   1,
                    STS6,   1,
                    STS7,   1
                }

                If (LAnd (LEqual (NCPU, 0x02), LEqual (And (TYPE, 0x0A),
                    0x0A)))
                {
                    Store (0x01, STS7)
                    Store (0x01, DEV7)
                    Load (SSDT, HNDL)
                }

                If (LAnd (LEqual (NCPU, 0x01), LEqual (And (TYPE, 0x01),
                    0x01)))
                {
                    If (LNot (And (TYPE, 0x10)))
                    {
                        Load (SSDT, HNDL)
                    }
                }
            }
        }

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are on the CC list for the bug, or are watching someone who is.
