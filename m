From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9848] acpi-cpufreq: Incomplete freq list on ASUS P5N32-E SLI
	PLUS with Intel(R) Core(TM)2 Quad
Date: Wed, 27 Feb 2008 07:51:32 -0800 (PST)
Message-ID: <20080227155132.3695D11D108@picon.linux-foundation.org>
References: <bug-9848-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9848-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9848


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED




------- Comment #3 from trenn@suse.de  2008-02-27 07:51 -------
This is the relevant part in one of the SSDTs.
You can search the ACPI spec for _PSS to be able to evaluate what exactly is
returned. It is either NPSS or SPSS which both include two frequencies with:
 a) 900 MHz (0x384)
 b) 600 MHz (0x258)

So this is a BIOS issue.
You may be able to tell more whether the value 900 MHz (and you enter real max,
2,6 GHZ or similar) or not by evaluating the other values, but I expect you
need Intel's/Venkatesh's help here.
But it would not make sense much anyway, this should get fixed in BIOS.


        Method (_PSS, 0, NotSerialized)
        {
            If (LOr (And (CFGD, 0x4000), And (CFGD, 0x00010000)))
            {
                Return (NPSS)
            }

            Return (SPSS)
        }

        Name (SPSS, Package (0x02)
        {
            Package (0x06)
            {
                0x00000384, 
                0x000157C0, 
                0x000000A0, 
                0x0000000A, 
                0x00000036, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000258, 
                0x0000E678, 
                0x000000A0, 
                0x0000000A, 
                0x00000136, 
                0x00000001
            }
        })
        Name (NPSS, Package (0x02)
        {
            Package (0x06)
            {
                0x00000384, 
                0x000157C0, 
                0x0000000A, 
                0x0000000A, 
                0x00000925, 
                0x00000925
            }, 

            Package (0x06)
            {
                0x00000258, 
                0x0000E678, 
                0x0000000A, 
                0x0000000A, 
                0x0000061B, 
                0x0000061B
            }
        })
    }


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
