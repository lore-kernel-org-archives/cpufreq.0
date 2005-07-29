From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH 1/1] Provide support for 6 bit FID codes
Date: Fri, 29 Jul 2005 10:16:35 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC2FA@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C59450.8223B8B0"
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C59450.8223B8B0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dave Jones [mailto:davej@redhat.com]=20
> Sent: Thursday, July 28, 2005 10:08 PM
> To: Langsdorf, Mark
> Cc: cpufreq@lists.linux.org.uk
> Subject: Re: [PATCH 1/1] Provide support for 6 bit FID codes
>=20
>=20
> On Thu, Jun 23, 2005 at 05:39:04PM -0500, Langsdorf, Mark=20
> wrote:  > Opteron revision F will support higher frequencies=20
> than  > can be encoded in the current driver's 4 bit=20
> frequency  > field.  This patch updates the driver to support=20
> Rev F  > including 6 bit FIDs and processor ID updates.  >=20
>  > This should apply cleanly whether or not the dual-core
>  > bugfix I sent out last week is applied.  I'd prefer=20
>  > that both get applied, of course.
>  >=20
>  > Signed-off-by: David Keck <david.keck@amd.com>
>  > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
>  >=20
>  > -Mark Langsdorf
>  > AMD, Inc.
>=20
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c: In function=20
> `powernow_k8_acpi_pst_values':
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698:=20
> `EXT_TYPE_SHIFT' undeclared (first use in this function)
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698: (Each=20
> undeclared identifier is reported only once
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698: for each=20
> function it appears in.)
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:698:=20
> `EXT_TYPE_MASK' undeclared (first use in this function)
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c: In function=20
> `powernow_k8_cpu_init_acpi':
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:740: warning:=20
> unused variable `vid'
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:739: warning:=20
> unused variable `fid'
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:743: warning:=20
> unused variable `vid'
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:742: warning:=20
> unused variable `fid'
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:746: `fid'=20
> undeclared (first use in this function)
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c:746: `vid'=20
> undeclared (first use in this function)
> make[1]: *** [arch/i386/kernel/cpu/cpufreq/powernow-k8.o] Error 1
> make: *** [arch/i386/kernel/cpu/cpufreq/powernow-k8.o] Error 2
>=20
> Looks like there's a chunk of this missing ? Can you send an=20
> incremental fixing this up please ?  I'll leave the previous=20
> diff in the cpufreq git tree, and just send the fix along=20
> with it when Linus pulls.
>=20
> Thanks,
>=20
> 		Dave
>=20
>=20

------_=_NextPart_001_01C59450.8223B8B0
Content-Type: application/octet-stream;
 name=rfpn2-2.6.12.patch
Content-Transfer-Encoding: base64
Content-Description: rfpn2-2.6.12.patch
Content-Disposition: attachment;
 filename=rfpn2-2.6.12.patch

LS0tIGxpbnV4LXJmcG4vYXJjaC9pMzg2L2tlcm5lbC9jcHUvY3B1ZnJlcS9wb3dlcm5vdy1rOC5o
Lm9yaWcJMjAwNS0wNy0xNSAwMDoxMjowOC4wMDAwMDAwMDAgLTA2MDAKKysrIGxpbnV4LXJmcG4v
YXJjaC9pMzg2L2tlcm5lbC9jcHUvY3B1ZnJlcS9wb3dlcm5vdy1rOC5oCTIwMDUtMDctMTUgMDA6
MTQ6NTIuMDAwMDAwMDAwIC0wNjAwCkBAIC0xMjUsMTIgKzEyNSwxNCBAQAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogI2RlZmluZSBJUlRfU0hJRlQgICAgICAz
MAogI2RlZmluZSBSVk9fU0hJRlQgICAgICAyOAorI2RlZmluZSBFWFRfVFlQRV9TSElGVCAyNwog
I2RlZmluZSBQTExfTF9TSElGVCAgICAyMAogI2RlZmluZSBNVlNfU0hJRlQgICAgICAxOAogI2Rl
ZmluZSBWU1RfU0hJRlQgICAgICAxMQogI2RlZmluZSBWSURfU0hJRlQgICAgICAgNgogI2RlZmlu
ZSBJUlRfTUFTSyAgICAgICAgMwogI2RlZmluZSBSVk9fTUFTSyAgICAgICAgMworI2RlZmluZSBF
WFRfVFlQRV9NQVNLICAgMQogI2RlZmluZSBQTExfTF9NQVNLICAgMHg3ZgogI2RlZmluZSBNVlNf
TUFTSyAgICAgICAgMwogI2RlZmluZSBWU1RfTUFTSyAgICAgMHg3Zgo=

------_=_NextPart_001_01C59450.8223B8B0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C59450.8223B8B0--


