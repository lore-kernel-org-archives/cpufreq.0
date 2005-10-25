From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Can't load speedstep-centrino on IBM x336?
Date: Mon, 24 Oct 2005 19:00:10 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60061BE91E@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: "Darrick J. Wong" <djwong@us.ibm.com>, Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk, Chris McDermott <lcm@us.ibm.com>


It is just that speedstep-centrino driver can only handle
FIXED_HARDWARE. For SYSTEM_IO you should be using acpi-cpufreq driver.
Please try that driver and things should work fine.

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Darrick J. Wong
>Sent: Monday, October 24, 2005 6:48 PM
>To: Dave Jones
>Cc: cpufreq@lists.linux.org.uk; Chris McDermott
>Subject: Can't load speedstep-centrino on IBM x336?
>
>Hi all,
>
>I've been trying to get Enhanced SpeedStep working on an IBM x336
>(3.6GHz Xeon).  If I load the speedstep-centrino driver with cpufreq
>debugging turned on, I get a message about "Invalid control/status
>registers (1 - 1)" and the module refuses to load.  It seems that the
>stumbling point is this chunk of code in centrino_cpu_init_acpi():
>
>if ((p.control_register.space_id !=3D ACPI_ADR_SPACE_FIXED_HARDWARE) ||
>    (p.status_register.space_id !=3D ACPI_ADR_SPACE_FIXED_HARDWARE)) {
>        dprintk("Invalid control/status registers (%x - %x)\n",
>               p.control_register.space_id,=20
>p.status_register.space_id);
>        result =3D -EIO;
>        goto err_unreg;
>}
>
>I decompiled the DSDT code that the BIOS supplies, and it=20
>seems that the
>_PCT method returns control and status registers in SystemIO space if
>\SMIM is set (it is set to 0x1 earlier):
>
>
>Method (_PCT, 0, NotSerialized)
>{
>    If (\SMIM)
>    {
>        Return (Package (0x02)
>        {
>            ResourceTemplate ()
>            {
>                Register (SystemIO, 0x10, 0x00, 0x0000000000000800)
>            },
>            ResourceTemplate ()
>            {
>                Register (SystemIO, 0x10, 0x00, 0x0000000000000804)
>            }
>        })
>    }
>    Return (Package (0x02)
>    {
>        ResourceTemplate ()
>        {
>            Register (FFixedHW, 0x40, 0x00, 0x0000000000000199)
>        },
>        ResourceTemplate ()
>        {
>            Register (FFixedHW, 0x10, 0x00, 0x0000000000000198)
>        }
>    })
>}
>
>I checked with the ACPI specs v2.0c and v3.0, and neither of them seem
>to restrict the register address space to "fixed hardware".  Linux,
>however, expects FIXED_HARDWARE, not SYSTEM_IO, causing the error
>space_id checking to trip.  However, EST seems to work just fine on the
>x336 without this check.  I built a kernel without this code and was
>able to switch frequencies and governors in a loop without any adverse
>effects.  /proc/cpuinfo was getting updated, too.
>
>So now I'm wondering three things: Is there a reason why there is this
>address space check?  Can we get rid of it?  And, am I supposed to be
>using acpi_cpufreq instead?  The speedstep_centrino code seems to
>indicate that my CPU revision (0xF41) should be supported by=20
>this driver...
>
>(Attached is a patch against 2.6.14-rc4 to get rid of the check.)
>
>--Darrick
>
