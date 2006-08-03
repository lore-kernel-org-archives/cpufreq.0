From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 8/8] acpi-cpufreq: skip duplicate frequencies
Date: Thu, 3 Aug 2006 14:10:50 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454566EC0@scsmsx413.amr.corp.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Alexey Starikovskiy
>Sent: Monday, July 31, 2006 11:58 AM
>To: Brown, Len; Dave Jones
>Cc: cpufreq@lists.linux.org.uk
>Subject: [PATCH 8/8] acpi-cpufreq: skip duplicate frequencies
>
> acpi-cpufreq.c |   12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>Skip duplicate frequencies reported by ACPI.
>
>Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>
>
>Index: linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>---=20
>linux-2.6.15.1.orig/arch/i386/kernel/cpu/cpufreq/acpi-cp
>ufreq.c	2006-07-31 21:23:47.000000000 +0400
>+++ linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=09
>2006-07-31 21:36:02.000000000 +0400
>@@ -22,7 +22,7 @@
>  *  with this program; if not, write to the Free Software=20
>Foundation, Inc.,
>  *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
>  *
>- *=20
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>~~~~~~~~~~~=20
>+ *=20
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>~~~~~~~~~~~
>  */
>=20
> #include <linux/config.h>
>@@ -476,8 +476,14 @@
> 		} else {
> 			data->freq_table[i].index =3D i;
> 		}
>-		data->freq_table[i].frequency =3D
>-		    perf->states[i].core_frequency * 1000;
>+		if (i =3D=3D 0 ||
>+		    perf->states[i].core_frequency !=3D
>+		    perf->states[i - 1].core_frequency) {
>+			data->freq_table[i].frequency =3D
>+			    perf->states[i].core_frequency * 1000;
>+		} else {
>+			data->freq_table[i].frequency =3D=20
>CPUFREQ_ENTRY_INVALID;
>+		}
> 	}
> 	data->freq_table[perf->state_count].frequency =3D=20
>CPUFREQ_TABLE_END;


I guess we should compact the whole table rather than adding INVALID
entries. With INVALID entries, we may end up running some redundant
loops table_verify table_target functions later.

Thanks,
Venki
=20
