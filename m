From: "Darrick J. Wong" <djwong@us.ibm.com>
Subject: Can't load speedstep-centrino on IBM x336?
Date: Mon, 24 Oct 2005 18:48:10 -0700
Message-ID: <435D8EDA.4030805@us.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0637519768=="
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk, Chris McDermott <lcm@us.ibm.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0637519768==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig05E2AC555CB53E8488ED7373"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig05E2AC555CB53E8488ED7373
Content-Type: multipart/mixed; boundary="------------070706010808070807050307"

This is a multi-part message in MIME format.
--------------070706010808070807050307
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I've been trying to get Enhanced SpeedStep working on an IBM x336
(3.6GHz Xeon).  If I load the speedstep-centrino driver with cpufreq
debugging turned on, I get a message about "Invalid control/status
registers (1 - 1)" and the module refuses to load.  It seems that the
stumbling point is this chunk of code in centrino_cpu_init_acpi():

if ((p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
    (p.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
        dprintk("Invalid control/status registers (%x - %x)\n",
               p.control_register.space_id, p.status_register.space_id);
        result = -EIO;
        goto err_unreg;
}

I decompiled the DSDT code that the BIOS supplies, and it seems that the
_PCT method returns control and status registers in SystemIO space if
\SMIM is set (it is set to 0x1 earlier):


Method (_PCT, 0, NotSerialized)
{
    If (\SMIM)
    {
        Return (Package (0x02)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 0x10, 0x00, 0x0000000000000800)
            },
            ResourceTemplate ()
            {
                Register (SystemIO, 0x10, 0x00, 0x0000000000000804)
            }
        })
    }
    Return (Package (0x02)
    {
        ResourceTemplate ()
        {
            Register (FFixedHW, 0x40, 0x00, 0x0000000000000199)
        },
        ResourceTemplate ()
        {
            Register (FFixedHW, 0x10, 0x00, 0x0000000000000198)
        }
    })
}

I checked with the ACPI specs v2.0c and v3.0, and neither of them seem
to restrict the register address space to "fixed hardware".  Linux,
however, expects FIXED_HARDWARE, not SYSTEM_IO, causing the error
space_id checking to trip.  However, EST seems to work just fine on the
x336 without this check.  I built a kernel without this code and was
able to switch frequencies and governors in a loop without any adverse
effects.  /proc/cpuinfo was getting updated, too.

So now I'm wondering three things: Is there a reason why there is this
address space check?  Can we get rid of it?  And, am I supposed to be
using acpi_cpufreq instead?  The speedstep_centrino code seems to
indicate that my CPU revision (0xF41) should be supported by this driver...

(Attached is a patch against 2.6.14-rc4 to get rid of the check.)

--Darrick

--------------070706010808070807050307
Content-Type: text/x-patch;
 name="x336-centrino.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="x336-centrino.patch"

diff -Naur b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-10-24 18:24:06.000000000 -0700
+++ a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2005-10-24 18:28:22.000000000 -0700
@@ -392,14 +392,6 @@
 		goto err_unreg;
 	}
 
-	if ((p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
-	    (p.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
-		dprintk("Invalid control/status registers (%x - %x)\n",
-			p.control_register.space_id, p.status_register.space_id);
-		result = -EIO;
-		goto err_unreg;
-	}
-
 	for (i=0; i<p.state_count; i++) {
 		if (p.states[i].control != p.states[i].status) {
 			dprintk("Different control (%llu) and status values (%llu)\n",

--------------070706010808070807050307--

--------------enig05E2AC555CB53E8488ED7373
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDXY7fa6vRYYgWQuURApAPAKCFNOKRVgGOzf56Rc6U3WfpMVClzgCeJxxT
eSv8ZRpvZGEq2iEhn3iaYOk=
=kTcg
-----END PGP SIGNATURE-----

--------------enig05E2AC555CB53E8488ED7373--


--===============0637519768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0637519768==--

