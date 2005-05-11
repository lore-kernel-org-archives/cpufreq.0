From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq on-demand governor up_treshold?
Date: Wed, 11 May 2005 09:00:07 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6004B453EE@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C55642.7C4D3B6E"
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Eric Piel <Eric.Piel@tremplin-utc.net>, Dave Jones <davej@redhat.com>
Cc: cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.net

This is a multi-part message in MIME format.

------_=_NextPart_001_01C55642.7C4D3B6E
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Thanks for rebasing-resending them Eric. I was planning to do that one =
of these days, but kept postponing too :(.

Dave: Here are couple of more patches for the pending-patches queue.

Thanks,
Venki=20


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Eric Piel
>Sent: Wednesday, May 11, 2005 5:19 AM
>To: Dave Jones
>Cc: cpufreq@zenii.linux.org.uk; linux@dominikbrodowski.net
>Subject: Re: cpufreq on-demand governor up_treshold?
>
>Dave Jones a =E9crit :
>> On Tue, May 10, 2005 at 09:33:34PM -0400, Dave Jones wrote:
>>  >=20
>>  > I'm preparing the first cpufreq->linus sync right now.
>>  > Can you write up some descriptions & signed-off-by: lines for
>>  > these three please ?
>>=20
>> Additionally, it'll need tweaking to diff on top of whats
>> currently in the pending queue. looks like the patch at
>>=20
>http://www.codemonkey.org.uk/projects/cpufreq/pending-patches/C
>PUFREQ-04-ondemand-cleanups.patch
>> upsets yours a little.
>>=20
>Here follows the three patches, updated for the last snapshot of=20
>cpufreq. I knew there was a conflict (CPUFREQ-04 is also a=20
>patch I wrote=20
>;-) ) but was too lasy to resend them. Here you are!
>
>Eric
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>

------_=_NextPart_001_01C55642.7C4D3B6E
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit

X-MimeOLE: Produced By Microsoft Exchange V6.5.7226.0
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] ondemand: change default sampling_down_factor
Date: Fri, 11 Mar 2005 18:20:35 -0700
Message-ID: <20050311172035.B17820@unix-os.sc.intel.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
To: "Dave Jones" <davej@redhat.com>,
	"Dominik Brodowski" <linux@dominikbrodowski.net>
Cc: <cpufreq@www.linux.org.uk>


Dave/Dominik,

Please Apply.

Thanks,
Venki


Make default sampling downfactor 1.
This works better with earlier auto downscaling change in ondemand =
governor.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.org	2005-03-11 =
19:41:12.000000000 -0800
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-03-11 =
19:43:00.000000000 -0800
@@ -51,7 +51,8 @@ static unsigned int 				def_sampling_rat
 #define MIN_SAMPLING_RATE			(def_sampling_rate / 2)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
-#define DEF_SAMPLING_DOWN_FACTOR		(10)
+#define DEF_SAMPLING_DOWN_FACTOR		(1)
+#define MAX_SAMPLING_DOWN_FACTOR		(10)
 #define TRANSITION_LATENCY_LIMIT		(10 * 1000)
 #define sampling_rate_in_HZ(x)			(((x * HZ) < (1000 * 1000))?1:((x * =
HZ) / (1000 * 1000)))
=20
@@ -119,6 +120,9 @@ static ssize_t store_sampling_down_facto
 	if (ret !=3D 1 )
 		return -EINVAL;
=20
+	if (input > MAX_SAMPLING_DOWN_FACTOR || input < 1)
+		return -EINVAL;
+
 	down(&dbs_sem);
 	dbs_tuners_ins.sampling_down_factor =3D input;
 	up(&dbs_sem);

------_=_NextPart_001_01C55642.7C4D3B6E
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit

X-MimeOLE: Produced By Microsoft Exchange V6.5.7226.0
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] Force ACPI cpufreq driver to setup freq at startup
Date: Thu, 10 Mar 2005 15:36:38 -0700
Message-ID: <20050310143638.A5103@unix-os.sc.intel.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
To: <davej@redhat.com>
Cc: <linux@dominikbrodowski.net>


Dave,

Please apply.

Thanks,
Venki


Force setting of frequency after startup, as the "guessing" of =
frequencies=20
in the ACPI cpufreq driver might be wrong. It is really unfortunate that =
the
ACPI specification does not provide us with a "get current P state" =
method.

This patch is needed by a platform that supports ACPI based cpufreq,
but boots up with lowest possible freq. Without this patch, ACPI cpufreq
assumes that the processors are running at the highest freq.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.11-mm2/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c.orig	=
2005-03-09 20:58:19.000000000 +0100
+++ linux-2.6.11-mm2/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	=
2005-03-09 20:59:49.000000000 +0100
@@ -442,6 +442,11 @@
 			(u32) data->acpi_data.states[i].transition_latency);
=20
 	cpufreq_frequency_table_get_attr(data->freq_table, policy->cpu);
+=09
+	/* the first call to ->target() should result in us actually
+	 * writing something to the appropriate registers. */
+	data->resume =3D 1;
+=09
 	return (result);
=20
  err_freqfree:

------_=_NextPart_001_01C55642.7C4D3B6E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C55642.7C4D3B6E--

